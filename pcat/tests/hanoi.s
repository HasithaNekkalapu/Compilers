#
# Label("hanoi_1")
#
hanoi_1:
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
# CJump(Binop("GT", Mem(Binop("PLUS", Reg("fp"), IntValue(16))), IntValue(0)),
#       "exit_3")
#
        lw         $t0, 16($fp)
        li         $t1, 0
        bgt        $t0,$t1
        beq        $t0, 1, exit_3
#
# Jump("cont_2")
#
        jr         cont_2
#
# Label("exit_3")
#
exit_3:
#
# CallP("hanoi_1",
#       Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#       List(Binop("MINUS",
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(16))),
#                  IntValue(1)),
#            Mem(Binop("PLUS", Reg("fp"), IntValue(12))),
#            Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#            Mem(Binop("PLUS", Reg("fp"), IntValue(8)))))
#
        subu       $sp, $sp, 16
        lw         $t0, 16($fp)
        li         $t1, 1
        subu       $t0,$t1
        sw         $t0, 16($sp)
        lw         $t0, 12($fp)
        sw         $t0, 12($sp)
        lw         $t0, 4($fp)
        sw         $t0, 8($sp)
        lw         $t0, 8($fp)
        sw         $t0, 4($sp)
        lw         $t0, -8($fp)
        move       $v0, $t0
        jal        hanoi_1
        addu       $sp, $sp, 16
        move       $t0, $a0
#
# SystemCall("WRITE_INT", Mem(Binop("PLUS", Reg("fp"), IntValue(16))))
#
        lw         $t0, 16($fp)
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
# SystemCall("WRITE_INT", Mem(Binop("PLUS", Reg("fp"), IntValue(12))))
#
        lw         $t0, 12($fp)
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
# SystemCall("WRITE_INT", Mem(Binop("PLUS", Reg("fp"), IntValue(8))))
#
        lw         $t0, 8($fp)
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
# CallP("hanoi_1",
#       Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#       List(Binop("MINUS",
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(16))),
#                  IntValue(1)),
#            Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#            Mem(Binop("PLUS", Reg("fp"), IntValue(8))),
#            Mem(Binop("PLUS", Reg("fp"), IntValue(12)))))
#
        subu       $sp, $sp, 16
        lw         $t0, 16($fp)
        li         $t1, 1
        subu       $t0,$t1
        sw         $t0, 16($sp)
        lw         $t0, 4($fp)
        sw         $t0, 12($sp)
        lw         $t0, 8($fp)
        sw         $t0, 8($sp)
        lw         $t0, 12($fp)
        sw         $t0, 4($sp)
        lw         $t0, -8($fp)
        move       $v0, $t0
        jal        hanoi_1
        addu       $sp, $sp, 16
        move       $t0, $a0
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
# Move(Reg("sp"), Binop("PLUS", Reg("sp"), IntValue(-12)))
#
        li         $t0, -12
        addu       $sp,$t0
        move       $sp,$sp
#
# CallP("hanoi_1",
#       Reg("fp"),
#       List(IntValue(5), IntValue(1), IntValue(2), IntValue(3)))
#
        subu       $sp, $sp, 16
        li         $t0, 5
        sw         $t0, 16($sp)
        li         $t0, 1
        sw         $t0, 12($sp)
        li         $t0, 2
        sw         $t0, 8($sp)
        li         $t0, 3
        sw         $t0, 4($sp)
        move       $v0, $fp
        jal        hanoi_1
        addu       $sp, $sp, 16
        move       $t0, $a0
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
