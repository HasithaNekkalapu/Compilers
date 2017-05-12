/**
 * **************************************************************************************************
 *
 * File: MIPS.scala
 * Generation of MIPS code from IR code
 *
 * **************************************************************************************************
 */

package edu.uta.pcat

import com.sun.glass.ui.Size

/** representation of a MIPS register */
case class Register(val reg: String) {
  override def toString(): String = reg
}

/** a pool of available registers */
class RegisterPool {

  val all_registers = List("$t0", "$t1", "$t2", "$t3", "$t4", "$t5", "$t6", "$t7", "$t8", "$t9",
    "$s0", "$s1", "$s2", "$s3", "$s4", "$s5", "$s6", "$s7")

  var available_registers = all_registers.map(Register(_))

  /** is register reg temporary? */
  def is_temporary(reg: Register): Boolean =
    reg match {
      case Register(n) => all_registers.contains(n)
    }

  /** return the next available temporary register */
  def get(): Register =
    available_registers match {
      case reg :: rs => {
        available_registers = rs
        reg
      }
      case _ => throw new Error("*** Run out of registers")
    }

  /** recycle (put back into the register pool) the register reg (if is temporary) */
  def recycle(reg: Register) {
    if (available_registers.contains(reg))
      throw new Error("*** Register has already been recycled: " + reg)
    if (is_temporary(reg))
      available_registers = reg :: available_registers
  }

  /** return the list of all temporary registers currently in use */
  def used(): List[Register] = {
    for (
      reg <- all_registers if (!available_registers.contains(Register(reg)))
    ) yield Register(reg)
  }
}

abstract class MipsGenerator {
  def clear()
  def emit(e: IRstmt)
}

class Mips extends MipsGenerator {

  var assert_count = 0

  /** emit a MIPS label */
  def mips_label(s: String) {
    PCAT.out.println(s + ":")
  }

  /** emit MIPS code with no operands */
  def mips(op: String) {
    PCAT.out.println("        " + op)
  }

  /** emit MIPS code with operands */
  def mips(op: String, args: String) {
    PCAT.out.print("        " + op)
    for (i <- op.length to 10)
      PCAT.out.print(" ")
    PCAT.out.println(args)
  }

  /** a pool of temporary registers */
  var rpool = new RegisterPool

  /** clear the register pool */
  def clear() {
    rpool = new RegisterPool
  }

  var name_counter = 0

  /** generate a new  label name */
  def new_label(): String = {
    name_counter += 1
    "L_" + name_counter
  }

  /** generate MIPS code from the IR expression e and return the register that will hold the result */
  def emit(e: IRexp): Register = {
    e match {
      case Mem(Binop("PLUS", Reg(r), IntValue(n))) => {
        val reg = rpool.get()
        mips("lw", reg + ", " + n + "($" + r + ")")
        reg
      }

      case Mem(x) => {
        val left = emit(x)
        mips("lw", left + "")
        left
      }
      case Binop("AND", x, y) => {
        val label = new_label()
        val left = emit(x)
        val reg = left
        mips("beq", left + ", 0, " + label)
        val right = emit(y)
        mips("move", left + ", " + right)
        mips_label(label)
        rpool.recycle(right)
        reg
      }
      case Binop("OR", x, y) => {
        val left = emit(x)
        val right = emit(y)
        mips("xor", left + "," + right)
        left
      }
      case Binop("PLUS", x, y) => {
        val left = emit(x)
        val right = emit(y)
        mips("addu", left + "," + right)
        left
      }
      case Binop("MINUS", x, y) => {
        val left = emit(x)
        val right = emit(y)
        mips("subu", left + "," + right)
        left
      }
      case Binop("TIMES", x, y) => {
        val left = emit(x)
        val right = emit(y)
        mips("mult", left + "," + right)
        left
      } case Binop("DIV", x, y) => {
        val left = emit(x)
        val right = emit(y)
        mips("div", left + "," + right)
        left
      } case Binop("EQ", x, y) => {
        val left = emit(x)
        val right = emit(y)
        mips("beq", left + "," + right)
        left
      }
      case Binop("LEQ", x, y) => {
        val left = emit(x)
        val right = emit(y)
        mips("ble", left + "," + right)
        left
      }
      case Binop("NEQ", x, y) => {
        val left = emit(x)
        val right = emit(y)
        mips("bne", left + "," + right)
        left
      }
      case Binop("GEQ", x, y) => {
        val left = emit(x)
        val right = emit(y)
        mips("bge", left + "," + right)
        left
      }
      case Binop("GT", x, y) => {
        val left = emit(x)
        val right = emit(y)
        mips("bgt", left + "," + right)
        left
      }
      case Binop("LT", x, y) => {
        val left = emit(x)
        val right = emit(y)
        mips("blt", left + "," + right)
        left
      }
      case Unop(op, x) => {
        op match {
          case "PLUS" => emit(x)
          case "MINUS" => {
            val left = emit(x)
            var reg = left
            if (!rpool.is_temporary(reg)) {
              reg = rpool.get()
            }
            mips("neg", reg + "," + left)
            reg
          }
          case "NOT" => {
            val left = emit(x)
            var reg = left
            if (!rpool.is_temporary(reg)) {
              reg = rpool.get()
            }
            mips("seq", reg + "," + left + ", 0")
            reg
          }
        }
      }
      case Reg(r) => {
        Register("$" + r)
      }
      case Allocate(exp) => {
        val size = emit(Binop("TIMES", exp, IntValue(4)))
        val addr = rpool.get()
        mips("move", addr + ", $gp")
        mips("addu", "$gp, $gp, " + size)
        rpool.recycle(size)
        addr
      }
      case IntValue(num) => {
        val reg = rpool.get()
        mips("li", reg + ", " + num)
        reg
      }
      case RealValue(num) => {
        val reg = rpool.get()
        mips("li", reg + ", " + num)
        reg
      }
      case StringValue(str) => {
        val reg = rpool.get()
        mips("li", reg + ", " + str)
        reg
      }
      case Call(f, sl, args) => {
        val used_regs = rpool.used()
        val size = (used_regs.length + args.length) * 4
        /* allocate space for used temporary registers */
        if (size > 0)
          mips("subu", "$sp, $sp, " + size)
        /* push the used temporary registers */
        var i = size
        for (r <- used_regs) {
          mips("sw", r + ", " + i + "($sp)")
          i -= 4
        }
        /* push arguments */
        i = args.length * 4
        for (a <- args) {
          val reg = emit(a)
          mips("sw", reg + ", " + i + "($sp)")
          rpool.recycle(reg)
          i -= 4
        }
        /* set $v0 to be the static link */
        val sreg = emit(sl)
        mips("move", "$v0, " + sreg)
        rpool.recycle(sreg)
        mips("jal", f)
        i = size
        /* pop the used temporary registers */
        for (r <- used_regs) {
          mips("lw", r + ", " + i + "($sp)")
          i -= 4
        }
        /* deallocate stack from args and used temporary registers */
        if (size > 0)
          mips("addu", "$sp, $sp, " + size)
        val res = rpool.get()
        mips("move", res + ", $a0")
        /* You shouldn't just return $a0 */
        res
      }
      /* PUT YOUR CODE HERE */

      case _ => throw new Error("Unknown IR: " + e)
    }
  }

  /** generate MIPS code from the IR statement e */
  def emit(e: IRstmt) {
    e match {
      case Move(Mem(Binop("PLUS", Reg(r), IntValue(n))), u) => {
        val src = emit(u)
        mips("sw", src + ", " + n + "($" + r + ")")
        rpool.recycle(src)
      }
      case Move(Mem(d), u) => {
        val dest = emit(d)
        val src = emit(u)
        mips("sw", src + ", (" + dest + ")")
        rpool.recycle(src)
        rpool.recycle(dest)
      }
      case Move(Reg(fp), Reg(sp)) => {
        mips("move", "$" + fp + ", $" + sp)
      }
      case Move(Reg(r), IntValue(c)) => mips("li", "$" + r + "," + c)

      case Move(Reg(r), Mem(Binop("PLUS", u, IntValue(n)))) => {
        val src = emit(u)
        mips("lw", "$" + r + "," + n + "(" + src + ")")
        rpool.recycle(src)
      }
      case Move(Reg(r), Mem(u)) => {
        val src = emit(u)
        mips("lw", "$" + r + "," + "(" + src + ")")
        rpool.recycle(src)
      }
      case Move(Reg(r), u) => {
        val src = emit(u)
        mips("move", "$" + r + "," + src)
        rpool.recycle(src)
      }

      case CallP(f, sl, args) => {
        val used_regs = rpool.used()
        val size = (used_regs.length + args.length) * 4
        /* allocate space for used temporary registers */
        if (size > 0)
          mips("subu", "$sp, $sp, " + size)
        /* push the used temporary registers */
        var i = size
        for (r <- used_regs) {
          mips("sw", r + ", " + i + "($sp)")
          i -= 4
        }
        /* push arguments */
        i = args.length * 4
        for (a <- args) {
          val reg = emit(a)
          mips("sw", reg + ", " + i + "($sp)")
          rpool.recycle(reg)
          i -= 4
        }
        /* set $v0 to be the static link */
        val sreg = emit(sl)
        mips("move", "$v0, " + sreg)
        rpool.recycle(sreg)
        mips("jal", f)
        i = size
        /* pop the used temporary registers */
        for (r <- used_regs) {
          mips("lw", r + ", " + i + "($sp)")
          i -= 4
        }
        /* deallocate stack from args and used temporary registers */
        if (size > 0)
          mips("addu", "$sp, $sp, " + size)
        val res = rpool.get()
        mips("move", res + ", $a0")
      }

      case Jump(str) => {
        mips("jr", str)
      }
      case CJump(x, str) => {
        val left = emit(x)
        mips("beq", left + ", 1, " + str)
        rpool.recycle(left)
      }
      case Label("main") => {
        mips(".global", "main")
        mips(".data")
        mips_label("AF_")
        mips(".asciiz", "\"\\n Assertion Failure at Address\"")
        mips_label("ENDL_")
        mips(".asciiz", "\"\\n\"")
        mips(".text")
        mips_label("Assertion Failed")
        mips("move", "t0, v0")
        mips("li", "$v0, 4")
        mips("li", "$a0, AF_")
        mips("syscall")
        mips("move", "a0, t0")
        mips("li", "$v0,1")
        mips("syscall")
        mips("li", "$v0, 4")
        mips("la", "$a0, ENDL_")
        mips("syscall")
        mips("li", "$v0,10")
        mips("syscall")
        mips_label("main")
      }
      case Label(exp) => {
        mips_label(exp)
      }
      case Assert(exp) => {
        val left = emit(exp)
        assert_count = assert_count + 1
        val label = "ASSERT_" + assert_count
        mips_label(label)
        mips("li", "$v0," + assert_count)
        mips("beq", left + ", 0, AssertionFailure")
        rpool.recycle(left)
      }
      case SystemCall("READ_STRING", Mem(st)) => {
        mips("li", "$v0, 8")
        mips("syscall")
        val r = emit(st)
        mips("sw", "$a1, (" + r + ")")
        mips("sw", "$a0, 4(" + r + ")")
        rpool.recycle(r)
      }
      case SystemCall(e, s) => {
        var a = e match {
          case "WRITE_STRING" => 4
          case "WRITE_INT"    => 1
          case "WRITE_FLOAT"  => 2
          case "WRITE_BOOL"   => 1
          case "READ_INT"     =>
          case "READ_FLOAT"   =>
          case _              => throw new Error("Incorrect Name (SystemCall)")
        }
        if (e == "WRITE_FLOAT")
          mips("move", "$f12, " + emit(s))
        else
          mips("move", "$a0," + emit(s))
        mips("li", "$v0," + a)
        mips("syscall")
      }

      case Return() => {
        mips("nop")
      }
      /* PUT YOUR CODE HERE */

      case _ => throw new Error("Unknown IR: " + e)
    }
  }
}
