#
# Label("main")
#
        .global    main
        .data
AF_:
        .asciiz    "\n Assertion Failure at Address"
ENDL_:
        .asciiz    "\n"
        .text
Assertion Failed:
        move       t0, v0
        li         $v0, 4
        li         $a0, AF_
        syscall
        move       a0, t0
        li         $v0,1
        syscall
        li         $v0, 4
        la         $a0, ENDL_
        syscall
        li         $v0,10
        syscall
main:
#
# Move(Mem(Reg("sp")), Reg("fp"))
#
        sw         $fp, ($sp)
#
# Move(Reg("fp"), Reg("sp"))
#
        move       $fp, $sp
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-4))), Reg("ra"))
#
        sw         $ra, -4($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-8))), Reg("v0"))
#
        sw         $v0, -8($fp)
#
# Move(Reg("sp"), Binop("PLUS", Reg("sp"), IntValue(-20)))
#
        li         $t0, -20
        addu       $sp,$t0
        move       $sp,$sp
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-16))), Allocate(IntValue(2)))
#
        li         $t0, 2
        li         $t1, 4
        mult       $t0,$t1
        move       $t2, $gp
        addu       $gp, $gp, $t0
        sw         $t2, -16($fp)
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                IntValue(0))),
#      IntValue(23))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        addu       $t0,$t1
        li         $t2, 23
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                IntValue(4))),
#      IntValue(67))
#
        lw         $t0, -16($fp)
        li         $t1, 4
        addu       $t0,$t1
        li         $t2, 67
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#      Mem(Binop("PLUS", Reg("fp"), IntValue(-16))))
#
        lw         $t0, -16($fp)
        sw         $t0, -12($fp)
#
# Assert(Binop("NEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(-12))), IntValue(0)))
#
        lw         $t0, -12($fp)
        li         $t1, 0
        bne        $t0,$t1
ASSERT_1:
        li         $v0,1
        beq        $t0, 0, AssertionFailure
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                IntValue(0))),
#      IntValue(89))
#
        lw         $t0, -12($fp)
        li         $t1, 0
        addu       $t0,$t1
        li         $t2, 89
        sw         $t2, ($t0)
#
# Assert(Binop("NEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(-12))), IntValue(0)))
#
        lw         $t0, -12($fp)
        li         $t1, 0
        bne        $t0,$t1
ASSERT_2:
        li         $v0,2
        beq        $t0, 0, AssertionFailure
#
# SystemCall("WRITE_INT",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                      IntValue(0))))
#
        lw         $t0, -12($fp)
        li         $t1, 0
        addu       $t0,$t1
        lw         $t0
        move       $a0,$t0
        li         $v0,1
        syscall
#
# SystemCall("WRITE_STRING", StringValue())
#
        li         $t0,   
        move       $a0,$t0
        li         $v0,4
        syscall
#
# Assert(Binop("NEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(-12))), IntValue(0)))
#
        lw         $t0, -12($fp)
        li         $t1, 0
        bne        $t0,$t1
ASSERT_3:
        li         $v0,3
        beq        $t0, 0, AssertionFailure
#
# SystemCall("WRITE_INT",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                      IntValue(4))))
#
        lw         $t0, -12($fp)
        li         $t1, 4
        addu       $t0,$t1
        lw         $t0
        move       $a0,$t0
        li         $v0,1
        syscall
#
# SystemCall("WRITE_STRING", StringValue("\n"))
#
        li         $t0, \n
        move       $a0,$t0
        li         $v0,4
        syscall
#
# Move(Reg("ra"), Mem(Binop("PLUS", Reg("fp"), IntValue(-4))))
#
        lw         $ra,-4($fp)
#
# Move(Reg("sp"), Reg("fp"))
#
        move       $sp, $fp
#
# Move(Reg("fp"), Mem(Reg("fp")))
#
        lw         $fp,($fp)
#
# Return()
#
        nop
