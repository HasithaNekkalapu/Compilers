/**
 * **************************************************************************************************
 *
 * File: Code.scala
 * The IR code generator for PCAT programs
 *
 * **************************************************************************************************
 */

package edu.uta.pcat

import scala.collection.mutable.Stack

abstract class CodeGenerator(tc: TypeChecker) {
  def typechecker = tc
  def st = tc.st
  def code(e: ProcDecl): IRstmt
  def allocate_variable(name: String, var_type: Type, fname: String): IRexp
}

class Code(tc: TypeChecker) extends CodeGenerator(tc) {

  /** holds the exit labels of loops (needed for the exit() statements) */
  var labels = new Stack[String]

  var name_counter = 0

  /** generate a new variable name */
  def new_name(name: String): String = {
    name_counter += 1
    name + "_" + name_counter
  }

  /** allocate a new variable at the end of the current frame and return the access code */
  def allocate_variable(name: String, var_type: Type, fname: String): IRexp = {
    st.lookup(fname) match {
      case Some(ProcDec(rtp, params, label, level, min_offset)) => {
        // allocate variable at the next available offset in frame
        st.insert(name, VarDec(var_type, level, min_offset))
        // the next available offset in frame is 4 bytes below
        st.replace(fname, ProcDec(rtp, params, label, level, min_offset - 4))
        // return the code that accesses the variable
        Mem(Binop("PLUS", Reg("fp"), IntValue(min_offset)))
      }
      case _ => throw new Error("No current function: " + fname)
    }
  }

  /** access a frame-allocated variable from the run-time stack */
  def access_variable(name: String, level: Int): IRexp = {
    st.lookup(name) match {
      case Some(VarDec(_, var_level, offset)) => {
        var res: IRexp = Reg("fp")
        // non-local variable: follow the static link (level-var_level) times
        for (i <- var_level + 1 to level)
          res = Mem(Binop("PLUS", res, IntValue(-8)))
        Mem(Binop("PLUS", res, IntValue(offset)))
      }
      case _ => throw new Error("Undefined variable: " + name)
    }
  }

  /**
   * return the IR code from the Expr e (level is the current function nesting level,
   *  fname is the name of the current function/procedure)
   */
  def code(e: Expr, level: Int, fname: String): IRexp = {
    e match {
      case BinOpExp(op, left, right) => {
        val cl = code(left, level, fname)
        val cr = code(right, level, fname)
        val nop = op.toUpperCase()
        Binop(nop, cl, cr)
      }
      case UnOpExp(op, expr) => {
        val cexp = code(expr, level, fname)
        val cop = op.toUpperCase()
        Unop(cop, cexp)
      }
      case LvalExp(lval) => {
        code(lval, level, fname)
      }
      case RecordExp(str, args) => {
        val R = allocate_variable("R", NamedType(str), fname)
        var cs: List[IRstmt] = List()
        var count = 0
        for ((str, inits) <- args) {
          cs = cs :+ Move(
            Mem(Binop("PLUS", R, IntValue(count * 4))), code(inits, level, fname))
          count = count + 1
        }
        ESeq(Seq(List(Move(R, Allocate(IntValue(count)))) ++ cs), R) // allocate len+1 words for A
      }
      /* case CallExp(str, args) => {
        var cs: List[IRstmt] = List()
        var count = 0
        for (inits <- args) {
            cs = cs :+ Move(Mem(), code(inits, level, fname))
          count = count + 1
        }
        Call(str,cs,)
      }
     */ case ArrayExp(nm, inits) => {
        // A is the array address
        val A = allocate_variable(new_name("A"), NamedType(nm), fname)
        // I is offset of end-of-array
        val I = allocate_variable(new_name("I"), typechecker.intType, fname)
        // for iterating through loops
        val i = allocate_variable(new_name("i"), typechecker.intType, fname)
        // IR that calculates the   length
        var len: IRexp = IntValue(0)
        var cs: List[IRstmt] = List()
        for ((n, v) <- inits)
          if (n == IntConst(1)) { // don't need a loop for this
            val cv = code(v, level, fname)
            len = Binop("PLUS", len, IntValue(1))
            cs = cs :+ Seq(List(Move(Mem(Binop("PLUS", A, I)), cv),
              Move(I, Binop("PLUS", I, IntValue(4)))))
          } else {
            val cn = code(n, level, fname)
            val cv = code(v, level, fname)
            val loop = new_name("loop")
            val exit = new_name("exit")
            len = Binop("PLUS", len, cn)
            cs = cs :+ Seq(List(Move(i, IntValue(0)),
              Label(loop), // a for-loop
              CJump(Binop("GEQ", i, cn), exit),
              Move(Mem(Binop("PLUS", A, I)), cv),
              Move(I, Binop("PLUS", I, IntValue(4))),
              Move(i, Binop("PLUS", i, IntValue(1))),
              Jump(loop),
              Label(exit)))
          }
        ESeq(Seq(List(Move(A, Allocate(Binop("PLUS", len, IntValue(1)))), // allocate len+1 words for A
          Move(Mem(A), len), // set the array length
          Move(I, IntValue(4))) // first available offset is 4
          ++ cs),
          A)
      }

      case CallExp(name, args) => {
        st.lookup(name) match {
          case Some(ProcDec(_, _, cfname, clevel, coffset)) => {
            var diff = clevel - level
            if (diff == 1)
              Call(name, Reg("fp"), args.map(code(_, level, fname)))
            else
              Call(name,
                Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
                args.map(code(_, level, fname)))
          }
        }
      }

      case IntConst(exp) => {
        IntValue(exp)
      }
      case StringConst(str) => {
        StringValue(str)
      }
      case RealConst(num) => {
        RealValue(num)
      }
      /* PUT YOUR CODE HERE */

      case _ => throw new Error("Wrong expression: " + e)
    }
  }

  /**
   * return the IR code from the Statement e (level is the current function nesting level,
   *  fname is the name of the current function/procedure)
   */
  def code(e: Stmt, level: Int, fname: String): IRstmt = {
    e match {
      case AssignSt(v, u) => {
        val cd = code(v, level, fname)
        val cs = code(u, level, fname)
        Move(cd, cs)
      }
      case IfSt(cond, thens, elses) => {
        var exitLabel = new_name("exit")
        var contLabel = new_name("cont")
        Seq(List(CJump(code(cond, level, fname), exitLabel),
          code(elses, level, fname),
          Jump(contLabel),
          Label(exitLabel),
          code(thens, level, fname),
          Label(contLabel)))
      }
      case CallSt(str, args) => {
        st.lookup(str) match {
          case Some(ProcDec(_, _, cfname, clevel, coffset)) => {
            var diff = clevel - level
            if (diff == 1)
              CallP(str, Reg("fp"), args.map(code(_, level, fname)))
            else
              CallP(str, Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
                args.map(code(_, level, fname)))
          }
        }
      }

      case ReadSt(args) => {
        var cs: List[IRstmt] = List()
        for (param <- args) {
          if (typechecker.typecheck(param) == typechecker.stringType)
            cs = cs :+ SystemCall("READ_STRING", code(param, level, fname))
          if (typechecker.typecheck(param) == typechecker.intType)
            cs = cs :+ SystemCall("READ_INT", code(param, level, fname))
          if (typechecker.typecheck(param) == typechecker.stringType)
            cs = cs :+ SystemCall("READ_FLOAT", code(param, level, fname))
        }
        cs = cs :+ SystemCall("WRITE_STRING", StringValue("\n"))
        Seq(cs)
      }
      case ForSt(v, lo, hi, inc, body) => {
        val vc = allocate_variable(v, NamedType("INTEGER"), fname)
        /* val w = access_variable(v,level)*/
        val l = code(lo, level, fname)
        val h = code(hi, level, fname)
        val i = code(inc, level, fname)
        val b = code(body, level, fname)

        var loopLabel = new_name("loopLabel")
        var exitLabel = new_name("exitLabel")
        Seq(List(
          Move(vc, l),
          Label(loopLabel),
          CJump(Binop("GT", vc, h), exitLabel),
          code(body, level, fname),
          Move(vc, Binop("PLUS", vc, i)),
          Jump(loopLabel),
          Label(exitLabel)))
      }
      case WriteSt(args) => {
        var cs: List[IRstmt] = List()
        for (param <- args) {
          if (typechecker.typecheck(param) == typechecker.stringType)
            cs = cs :+ SystemCall("WRITE_STRING", code(param, level, fname))
          if (typechecker.typecheck(param) == typechecker.intType)
            cs = cs :+ SystemCall("WRITE_INT", code(param, level, fname))
          if (typechecker.typecheck(param) == typechecker.stringType)
            cs = cs :+ SystemCall("WRITE_FLOAT", code(param, level, fname))
        }
        cs = cs :+ SystemCall("WRITE_STRING", StringValue("\n"))
        Seq(cs)
      }
      case WhileSt(cond, body) => {
        var exitLabel = new_name("exit")
        var contLabel = new_name("cont")
        Seq(List(CJump(code(cond, level, fname), exitLabel),
          code(body, level, fname),
          Label(contLabel)))
      }
      case ExitSt() => {
        var exitLabel = new_name("exit")
        Label(exitLabel)
      }
      case LoopSt(body) => {
        Seq(List(code(body, level, fname)))
      }
      case SeqSt(args) => {
        var cs: List[IRstmt] = List()
        for (param <- args) {
          cs = cs :+ code(param, level, fname)
        }
        Seq(cs)
      }
      case ReturnSt() => {
        Return()
      }
      case ReturnValueSt(value) => {
        Seq(List(
          Move(Reg("ra"), Mem(Binop("PLUS", Reg("fp"), IntValue(-4)))),
          Move(Reg("sp"), Reg("fp")),
          Move(Reg("fp"), Mem(Reg("fp"))),
          Return()))

      }
      /* PUT YOUR CODE HERE */

      case _ => throw new Error("Wrong statement: " + e)
    }
  }

  /**
   * return the IR code from the Lvalue e (level is the current function nesting level,
   *  fname is the name of the current function/procedure)
   */
  def code(e: Lvalue, level: Int, fname: String): IRexp = {
    e match {
      case Var("FALSE") => IntValue(0)
      case Var("TRUE")  => IntValue(1)
      case Var("NIL")   => IntValue(0)
      case Var(s)       => access_variable(s, level)

      /* PUT YOUR CODE HERE */

      case RecordDeref(rec, ind) => {
        val c = code(rec, level, fname)
        typechecker.expandType(typechecker.typecheck(rec)) match {
          case RecordType(cl) => {
            val i = cl.map(_._1).indexOf(ind)
            Mem(Binop("PLUS", c, IntValue(i * 4)))
          }
        }
      }

      case ArrayDeref(arr, ind) => {
        var a = code(arr, level, fname)
        var i = code(ind, level, fname)

        ESeq(
          Assert(Binop("AND",
            Binop("GEQ", i, IntValue(0)),
            Binop("LT", i, Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(4))))))),
          Mem(Binop("PLUS",
            Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
            Binop("TIMES", Binop("PLUS", i, IntValue(0)), IntValue(4)))))

      }
      case _ => throw new Error("Wrong statement: " + e)
    }
  }

  /**
   * return the IR code from the function body (level is the current function nesting level,
   *  f is the name of the current function/procedure)
   */
  def code(e: Body, level: Int, f: String): IRstmt = {
    e match {
      case Body(ds, s) => {
        val defs = Seq(ds.map(code(_, f, level)))
        val body = Seq(s.map(code(_, level, f)))
        val inits = Seq(for (
          VarDecls(vds) <- ds;
          VarDecl(vs, _, u) <- vds;
          uc = code(u, level, f);
          v <- vs
        ) yield Move(access_variable(v, level), uc))
        st.lookup(f) match {
          case Some(ProcDec(_, _, fname, _, offset)) => Seq(List(defs,
            Label(fname),
            Move(Mem(Reg("sp")), Reg("fp")),
            Move(Reg("fp"), Reg("sp")),
            Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-4))), Reg("ra")),
            Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-8))), Reg("v0")),
            Move(Reg("sp"), Binop("PLUS", Reg("sp"), IntValue(offset))),
            inits,
            body,
            Move(Reg("ra"), Mem(Binop("PLUS", Reg("fp"), IntValue(-4)))),
            Move(Reg("sp"), Reg("fp")),
            Move(Reg("fp"), Mem(Reg("fp"))),
            Return()))
          case _ => throw new Error("Unkown function: " + f)
        }
      }
    }
  }

  /**
   * return the IR code for the declaration block of function fname
   * (level is the current function nesting level)
   */
  def code(e: Declaration, fname: String, level: Int): IRstmt = {
    e match {
      case TypeDecls(tds) => {
        for (TypeDecl(n, t) <- tds)
          st.insert(n, TypeDec(t))
        Seq(List())
      }
      case VarDecls(vds) => {
        for (VarDecl(vs, t, u) <- vds; v <- vs)
          if (t == "NoType")
            allocate_variable(v, typechecker.typecheck(u), fname)
          else allocate_variable(v, NamedType(t), fname)
        Seq(List())
      }
      case ProcDecls(pds) => {
        for (ProcDecl(f, ot, ps, b) <- pds)
          st.insert(f, ProcDec(NamedType(ot),
            ps.flatMap({
              case (vs, t) => vs.map(_ -> NamedType(t))
            }), new_name(f), level + 1, -12))
        Seq(for (ProcDecl(f, ot, ps, b) <- pds) yield {
          var i = 4
          st.begin_scope()
          for ((vs, t) <- ps.reverse; v <- vs.reverse) {
            st.insert(v, VarDec(NamedType(t), level + 1, i))
            i += 4
          }
          val res = code(b, level + 1, f)
          st.end_scope()
          res
        })
      }
    }
  }

  /** generate code for the main program */
  def code(e: ProcDecl): IRstmt = {
    e match {
      case ProcDecl(f, ot, ps, b) => {
        var i = 4
        st.begin_scope()
        st.insert(f, ProcDec(NamedType(ot), List(), f, 1, -12))
        val res = code(b, 1, f)
        st.end_scope()
        res
      }
    }
  }

}