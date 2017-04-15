/**
 * **************************************************************************************************
 *
 * File: TypeCheck.scala
 * The type-checker for PCAT programs
 *
 * **************************************************************************************************
 */

package edu.uta.pcat

import scala.collection.immutable.ListMap
import java.lang.invoke.MethodHandles.Lookup

abstract class TypeChecker {
  var trace_typecheck = false

  /** symbol table to store PCAT declarations */
  var st = new SymbolTable

  /* various types */
  val anyType = AnyType()
  val noType = NamedType("NoType")
  val intType = NamedType("INTEGER")
  val boolType = NamedType("BOOLEAN")
  val floatType = NamedType("FLOAT")
  val stringType = NamedType("STRING")

  def expandType(tp: Type): Type
  def typecheck(e: Expr): Type
  def typecheck(e: Lvalue): Type
  def typecheck(e: Stmt)
  def typecheck(e: Body, returned: Type)
  def typecheck(e: ProcDecl)
}

class TypeCheck extends TypeChecker {

  /** the expected type of the return value from the current function */
  var expected_returned_type: Type = null

  /** If tp is a named type, expand it */
  def expandType(tp: Type): Type = {
    if (tp.equals(intType) || tp.equals(boolType)
      || tp.equals(floatType) || tp.equals(stringType)
      || tp.equals(anyType) || tp.equals(noType))
      tp
    else tp match {
      case NamedType(nm) => st.lookup(nm) match {
        case Some(TypeDec(t)) => expandType(t)
        case _                => throw new Error("Undeclared type: " + tp)
      }
      case _ => tp
    }
  }

  /** returns true if the types tp1 and tp2 are equal under name equivalence */
  def typeEquivalence(tp1: Type, tp2: Type): Boolean = {
    /* AnyType() matches any RecordType(...) */
    if (tp1.equals(tp2))
      true
    else expandType(tp1) match {
      case RecordType(_) => tp2.equals(anyType)
      case _ => expandType(tp2) match {
        case RecordType(_) => tp1.equals(anyType)
        case _             => false
      }
    }
  }

  /* Tracing level */
  var level: Int = -1

  def trace[T](e: Any, result: => T): T = {
    if (trace_typecheck) {
      level += 1
      println(" " * (3 * level) + "** " + e)
    }
    val res = result
    if (trace_typecheck) {
      print(" " * (3 * level))
      if (res == ())
        println("->")
      else println("-> " + res)
      level -= 1
    }
    res
  }

  /** typecheck an expression AST */
  def typecheck(e: Expr): Type =
    trace(e, e match {
      case BinOpExp(op, l, r) => {
        val ltp = typecheck(l)
        val rtp = typecheck(r)
        if (!typeEquivalence(ltp, rtp))
          throw new Error("Incompatible types in binary operation: " + e)
        else if (op.equals("and") || op.equals("or"))
          if (typeEquivalence(ltp, boolType))
            ltp
          else throw new Error("AND/OR operation can only be applied to booleans: " + e)
        else if (op.equals("eq") || op.equals("neq"))
          boolType
        else if (!typeEquivalence(ltp, intType) && !typeEquivalence(ltp, floatType))
          throw new Error("Binary arithmetic operations can only be applied to integer or real numbers: " + e)
        else if (op.equals("gt") || op.equals("lt") || op.equals("geq") || op.equals("leq"))
          boolType
        else ltp
      }

      case UnOpExp(op, l) => {
        val ltp = typecheck(l)
        if (op.equals("minus") && typeEquivalence(ltp, intType))
          intType
        else if (op.equals("minus") && typeEquivalence(ltp, floatType))
          floatType
        else if (op.equals("not") && typeEquivalence(ltp, boolType))
          boolType
        else throw new Error("Wrong unary operation: " + e)
      }

      case LvalExp(l) => {
        typecheck(l)
      }

      case CallExp(str, args) => st.lookup(str) match {
        case None => throw new Error("no such Call")

        case Some(ProcDec(typ, param, _, _, _)) =>
          {
            if (param.length != args.length)
              throw new Error("Number of arguments do not match")
            else (args.map(typecheck(_)) zip param).map({
              case (atp, (_, ptp)) => if (!typeEquivalence(atp, ptp))
                throw new Error("Type not equivalent")
            })
          }
          typ
        case Some(TypeDec(_)) => {
          throw new Error("Should be an call Expression" + e)
        }
        case Some(VarDec(_, _, _)) => {
          throw new Error("Should be an call Expression" + e)
        }
      }

      case RecordExp(str, arglist) => st.lookup(str) match {
        case None => throw new Error("no such record")
        case Some(TypeDec(RecordType(t))) => {
          (arglist.zip(t)).map {
            case ((x, y), (u, v)) =>
              val rt = NamedType(v)
              if (x.equals(u)) {
                if (typeEquivalence(rt, typecheck(y)))
                  rt
              } else throw new Error("Wrong Record attribute: " + x)
          }
          NamedType(str)
        }
        case Some(ProcDec(_, _, _, _, _)) => {
          throw new Error("Should be an record" + e)
        }
        case Some(VarDec(_, _, _)) => {
          throw new Error("Should be an record" + e)
        }
        case Some(TypeDec(AnyType())) => {
          throw new Error("Should be an record" + e)
        }
        case Some(TypeDec(NamedType(t))) => {
          throw new Error("Should be an record" + e)
        }
        case Some(TypeDec(ArrayType(t))) => {
          throw new Error("Should be an record" + e)
        }
      }

      case ArrayExp(str, args) => st.lookup(str) match {
        case None => throw new Error("no such array")
        case Some(TypeDec(a)) => {
          for (arg <- args) {
            if (!typeEquivalence(typecheck(arg._1), intType))
              throw new Error("Should be an integer" + e)
            typecheck(arg._2)
          }
          NamedType(str)
        }
        case Some(ProcDec(_, _, _, _, _)) => {
          throw new Error("Should be an array" + e)
        }
        case Some(VarDec(_, _, _)) => {
          throw new Error("Should be an array" + e)
        }
      }

      case IntConst(t)      => { intType }
      case RealConst(t)     => { floatType }
      case StringConst(str) => { stringType }

    })

  /** typecheck an Lvalue AST */
  def typecheck(e: Lvalue): Type =
    trace(e, e match {
      case Var(name) => {
        if (name.equals("TRUE") || name.equals("FALSE") || name.equals("NIL")) {
          boolType
        } else {
          st.lookup(name) match {

            case Some(VarDec(t, _, _)) => t
            case Some(_)               => throw new Error(name + " is not a variable")
            case None                  => throw new Error("Undefined variable: " + name)
          }
        }
      }
      /* PUT YOUR CODE HERE */

      case ArrayDeref(l, ind) => {
        var indx = typecheck(ind)
        var lval = typecheck(l)
        if (!typeEquivalence(indx, intType))
          throw new Error("Wrong lvalue: " + e)
        expandType(lval) match {
          case ArrayType(t) => NamedType(t)
        }
      }

      case RecordDeref(lval, str) => {
        var l = typecheck(lval)
        expandType(l) match {
          case RecordType(t) =>
            {
              var i = 0
              var ind = 0
              for (i <- 0 to t.length - 1) {
                if (t(i)._1 == str) ind = i
              }
              NamedType(t(ind)._2)
            }
          case _ => throw new Error("no")
        }
      }
      case _ => throw new Error("Wrong lvalue: " + e)
    })

  /** typecheck the body of a function */
  def typecheck(e: Stmt) {
    trace(e,
      e match {
        case AssignSt(d, s) => if (!typeEquivalence(typecheck(d), typecheck(s)))
          throw new Error("Incompatible types in assignment: " + e)

        case CallSt(str, args) => st.lookup(str) match {
          case None => throw new Error("This is an error Statement" + e)
          case Some(ProcDec(typ, param, _, _, _)) =>
            {
              if (param.length != args.length)
                throw new Error("Number of arguments do not match")
              else (args.map(typecheck(_)) zip param).map({
                case (atp, (_, ptp)) => if (!typeEquivalence(atp, ptp))
                  throw new Error("Type not equivalent")
              })
            }
            typ
          case Some(TypeDec(t)) => {
            throw new Error("Should be an Call Statement" + e)
          }
          case Some(VarDec(_, _, _)) => {
            throw new Error("Should be an Call Statement" + e)
          }

        }

        case ReadSt(args) => {
          args.map(typecheck(_)).map {
            case (a) => if (typeEquivalence(intType, a)) {}
            else if (typeEquivalence(floatType, a)) {}
            else throw new Error("Incorrect Read Variable : " + a)
          }
        }

        case WriteSt(args) => {
          args.map(typecheck(_)).map {
            case (a) => if (typeEquivalence(intType, a)) {}
            else if (typeEquivalence(floatType, a)) {}
            else if (typeEquivalence(stringType, a)) {}
            else if (typeEquivalence(boolType, a)) {}
            else throw new Error("Incorrect Write Expression : " + a)
          }
        }

        case IfSt(ex, s1, s2) => {
          val exp = typecheck(ex)
          if (!typeEquivalence(exp, boolType))
            throw new Error("" + e)
          val stmt1 = typecheck(s1)
          val stmt2 = typecheck(s2)
        }

        case WhileSt(ex, s) => {
          val exp = typecheck(ex)
          if (!typeEquivalence(exp, boolType))
            throw new Error("Incorrect Expression for while" + exp)
          val stmt = typecheck(s)
        }

        case LoopSt(s) => {
          val ex = typecheck(s)
        }

        case ForSt(i, e1, e2, inc, stmt) => {
          st.begin_scope()

          st.insert(i, VarDec(intType, 0, 0))

          val inexp = typecheck(e1)
          val stp = typecheck(e2)
          val increxp = typecheck(inc)
          typecheck(stmt)

          if (typeEquivalence(intType, inexp)) {}

          else throw new Error("Incorrect Expression in for : " + inexp)
          if (typeEquivalence(intType, stp)) {}

          else throw new Error("Incorrect Expression in for : " + stp)
          if (typeEquivalence(intType, increxp)) {}

          else throw new Error("Incorrect Expression in for : " + increxp)

          st.end_scope()
        }

        case ExitSt() => {
        }

        case ReturnValueSt(exp) => {
          typecheck(exp)
        }

        case ReturnSt() => {
        }

        case SeqSt(args) => {
          args.map(typecheck(_))
        }
        /* PUT YOUR CODE HERE */

        case _ => throw new Error("Wrong statement: " + e)
      })
  }

  /** typecheck the body of a function */
  def typecheck(e: Body, returned: Type) {
    trace(e,
      e match {
        case Body(ds, s) => {
          ds.foreach(typecheck(_))
          expected_returned_type = returned
          s.foreach(typecheck(_))
        }
      })
  }

  /** typecheck a declaration block */
  def typecheck(e: Declaration) {
    trace(e,
      e match {
        case TypeDecls(tds) => for (TypeDecl(n, t) <- tds)
          st.insert(n, TypeDec(t))
        case VarDecls(vds) => for (VarDecl(vs, t, u) <- vds; v <- vs)
          if (t == "NoType")
            st.insert(v, VarDec(typecheck(u), 0, 0))
          else if (!typeEquivalence(typecheck(u), NamedType(t)))
            throw new Error("Incompatible types in variable declaration: " + e)
          else st.insert(v, VarDec(NamedType(t), 0, 0))
        case ProcDecls(pds) => {
          for (ProcDecl(f, ot, ps, b) <- pds)
            st.insert(f, ProcDec(NamedType(ot),
              ps.flatMap({
                case (vs, t) => vs.map(_ -> NamedType(t))
              }), "", 0, 0))
          for (ProcDecl(f, ot, ps, b) <- pds) {
            st.begin_scope()
            for ((vs, t) <- ps; v <- vs)
              st.insert(v, VarDec(NamedType(t), 0, 0))
            typecheck(b, NamedType(ot))
            st.end_scope()
          }
        }
      })
  }

  /** typecheck the main program */
  def typecheck(e: ProcDecl) {
    try {
      e match {
        case ProcDecl(f, ot, ps, b) => {
          st.begin_scope()
          typecheck(b, NamedType(ot))
          st.end_scope()
        }
      }
    } catch {
      case e: Error =>
        println("*** Type checking error: " + e)
        sys.exit(-1)
    }
  }
}