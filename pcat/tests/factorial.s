#
# Label("fact_1")
#
fact_1:
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
# Move(Reg("sp"), Binop("PLUS", Reg("sp"), IntValue(-12)))
#
        li         $t0, -12
        addu       $sp,$t0
        move       $sp,$sp
#
# CJump(Binop("LEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(4))), IntValue(0)),
#       "exit_3")
#
        lw         $t0, 4($fp)
        li         $t1, 0
        ble        $t0,$t1
        beq        $t0, 1, exit_3
#
# Move(Reg("a0"),
#      Binop("TIMES",
#            Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#            Call("fact_1",
#                 Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                 List(Binop("MINUS",
#                            Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                            IntValue(1))))))
#
        lw         $t0, 4($fp)
        subu       $sp, $sp, 8
        sw         $t0, 8($sp)
        lw         $t1, 4($fp)
        li         $t2, 1
        subu       $t1,$t2
        sw         $t1, 4($sp)
        lw         $t1, -8($fp)
        move       $v0, $t1
        jal        fact_1
        lw         $t0, 8($sp)
        addu       $sp, $sp, 8
        move       $t1, $a0
        mult       $t0,$t1
        move       $a0,$t0
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
#
# Jump("cont_2")
#
        jr         cont_2
#
# Label("exit_3")
#
exit_3:
#
# Move(Reg("a0"), IntValue(1))
#
        li         $a0,1
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
#
# Label("cont_2")
#
cont_2:
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
# Move(Reg("sp"), Binop("PLUS", Reg("sp"), IntValue(-16)))
#
        li         $t0, -16
        addu       $sp,$t0
        move       $sp,$sp
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-12))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -12($fp)
#
# SystemCall("WRITE_STRING", StringValue("Enter a number:"))
#
        li         $t0, Enter a number:
        move       $a0,$t0
        li         $v0,4
        syscall
#
# SystemCall("WRITE_STRING", StringValue("\n"))
#
        li         $t0, \n
        move       $a0,$t0
        li         $v0,4
        syscall
#
# SystemCall("READ_INT", Mem(Binop("PLUS", Reg("fp"), IntValue(-12))))
#
        lw         $t0, -12($fp)
        move       $a0,$t0
        li         $v0,()
        syscall
#
# SystemCall("WRITE_INT",
#            Call("fact_1",
#                 Reg("fp"),
#                 List(Mem(Binop("PLUS", Reg("fp"), IntValue(-12))))))
#
        subu       $sp, $sp, 4
        lw         $t0, -12($fp)
        sw         $t0, 4($sp)
        move       $v0, $fp
        jal        fact_1
        addu       $sp, $sp, 4
        move       $t0, $a0
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
