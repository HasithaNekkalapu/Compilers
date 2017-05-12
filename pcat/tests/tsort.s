#
# Label("insert_1")
#
insert_1:
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
# Move(Reg("sp"), Binop("PLUS", Reg("sp"), IntValue(-24)))
#
        li         $t0, -24
        addu       $sp,$t0
        move       $sp,$sp
#
# CJump(Binop("EQ", Mem(Binop("PLUS", Reg("fp"), IntValue(8))), IntValue(0)),
#       "exit_3")
#
        lw         $t0, 8($fp)
        li         $t1, 0
        beq        $t0,$t1
        beq        $t0, 1, exit_3
#
# Assert(Binop("NEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(8))), IntValue(0)))
#
        lw         $t0, 8($fp)
        li         $t1, 0
        bne        $t0,$t1
ASSERT_1:
        li         $v0,1
        beq        $t0, 0, AssertionFailure
#
# CJump(Binop("LEQ",
#             Mem(Binop("PLUS",
#                       Mem(Binop("PLUS", Reg("fp"), IntValue(8))),
#                       IntValue(0))),
#             Mem(Binop("PLUS", Reg("fp"), IntValue(4)))),
#       "exit_6")
#
        lw         $t0, 8($fp)
        li         $t1, 0
        addu       $t0,$t1
        lw         $t0
        lw         $t2, 4($fp)
        ble        $t0,$t2
        beq        $t0, 1, exit_6
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-20))), Allocate(IntValue(3)))
#
        li         $t0, 3
        li         $t1, 4
        mult       $t0,$t1
        move       $t2, $gp
        addu       $gp, $gp, $t0
        sw         $t2, -20($fp)
#
# Assert(Binop("NEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(8))), IntValue(0)))
#
        lw         $t0, 8($fp)
        li         $t1, 0
        bne        $t0,$t1
ASSERT_2:
        li         $v0,2
        beq        $t0, 0, AssertionFailure
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-20))),
#                IntValue(0))),
#      Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(8))),
#                IntValue(0))))
#
        lw         $t0, -20($fp)
        li         $t1, 0
        addu       $t0,$t1
        lw         $t2, 8($fp)
        li         $t3, 0
        addu       $t2,$t3
        lw         $t2
        sw         $t2, ($t0)
#
# Assert(Binop("NEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(8))), IntValue(0)))
#
        lw         $t0, 8($fp)
        li         $t1, 0
        bne        $t0,$t1
ASSERT_3:
        li         $v0,3
        beq        $t0, 0, AssertionFailure
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-20))),
#                IntValue(4))),
#      Call("insert_1",
#           Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#           List(Mem(Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(8))),
#                          IntValue(4))),
#                Mem(Binop("PLUS", Reg("fp"), IntValue(4))))))
#
        lw         $t0, -20($fp)
        li         $t1, 4
        addu       $t0,$t1
        subu       $sp, $sp, 16
        sw         $t0, 16($sp)
        sw         $t1, 12($sp)
        lw         $t2, 8($fp)
        li         $t3, 4
        addu       $t2,$t3
        lw         $t2
        sw         $t2, 8($sp)
        lw         $t2, 4($fp)
        sw         $t2, 4($sp)
        lw         $t2, -8($fp)
        move       $v0, $t2
        jal        insert_1
        lw         $t0, 16($sp)
        lw         $t1, 12($sp)
        addu       $sp, $sp, 16
        move       $t2, $a0
        sw         $t2, ($t0)
#
# Assert(Binop("NEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(8))), IntValue(0)))
#
        lw         $t0, 8($fp)
        li         $t1, 0
        bne        $t0,$t1
ASSERT_4:
        li         $v0,4
        beq        $t0, 0, AssertionFailure
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-20))),
#                IntValue(8))),
#      Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(8))),
#                IntValue(8))))
#
        lw         $t0, -20($fp)
        li         $t1, 8
        addu       $t0,$t1
        lw         $t2, 8($fp)
        li         $t3, 8
        addu       $t2,$t3
        lw         $t2
        sw         $t2, ($t0)
#
# Move(Reg("a0"), Mem(Binop("PLUS", Reg("fp"), IntValue(-20))))
#
        lw         $a0,-20($fp)
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
# Jump("cont_5")
#
        jr         cont_5
#
# Label("exit_6")
#
exit_6:
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-16))), Allocate(IntValue(3)))
#
        li         $t0, 3
        li         $t1, 4
        mult       $t0,$t1
        move       $t2, $gp
        addu       $gp, $gp, $t0
        sw         $t2, -16($fp)
#
# Assert(Binop("NEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(8))), IntValue(0)))
#
        lw         $t0, 8($fp)
        li         $t1, 0
        bne        $t0,$t1
ASSERT_5:
        li         $v0,5
        beq        $t0, 0, AssertionFailure
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                IntValue(0))),
#      Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(8))),
#                IntValue(0))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        addu       $t0,$t1
        lw         $t2, 8($fp)
        li         $t3, 0
        addu       $t2,$t3
        lw         $t2
        sw         $t2, ($t0)
#
# Assert(Binop("NEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(8))), IntValue(0)))
#
        lw         $t0, 8($fp)
        li         $t1, 0
        bne        $t0,$t1
ASSERT_6:
        li         $v0,6
        beq        $t0, 0, AssertionFailure
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                IntValue(4))),
#      Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(8))),
#                IntValue(4))))
#
        lw         $t0, -16($fp)
        li         $t1, 4
        addu       $t0,$t1
        lw         $t2, 8($fp)
        li         $t3, 4
        addu       $t2,$t3
        lw         $t2
        sw         $t2, ($t0)
#
# Assert(Binop("NEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(8))), IntValue(0)))
#
        lw         $t0, 8($fp)
        li         $t1, 0
        bne        $t0,$t1
ASSERT_7:
        li         $v0,7
        beq        $t0, 0, AssertionFailure
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                IntValue(8))),
#      Call("insert_1",
#           Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#           List(Mem(Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(8))),
#                          IntValue(8))),
#                Mem(Binop("PLUS", Reg("fp"), IntValue(4))))))
#
        lw         $t0, -16($fp)
        li         $t1, 8
        addu       $t0,$t1
        subu       $sp, $sp, 16
        sw         $t0, 16($sp)
        sw         $t1, 12($sp)
        lw         $t2, 8($fp)
        li         $t3, 8
        addu       $t2,$t3
        lw         $t2
        sw         $t2, 8($sp)
        lw         $t2, 4($fp)
        sw         $t2, 4($sp)
        lw         $t2, -8($fp)
        move       $v0, $t2
        jal        insert_1
        lw         $t0, 16($sp)
        lw         $t1, 12($sp)
        addu       $sp, $sp, 16
        move       $t2, $a0
        sw         $t2, ($t0)
#
# Move(Reg("a0"), Mem(Binop("PLUS", Reg("fp"), IntValue(-16))))
#
        lw         $a0,-16($fp)
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
# Label("cont_5")
#
cont_5:
#
# Jump("cont_2")
#
        jr         cont_2
#
# Label("exit_3")
#
exit_3:
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-12))), Allocate(IntValue(3)))
#
        li         $t0, 3
        li         $t1, 4
        mult       $t0,$t1
        move       $t2, $gp
        addu       $gp, $gp, $t0
        sw         $t2, -12($fp)
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                IntValue(0))),
#      Mem(Binop("PLUS", Reg("fp"), IntValue(4))))
#
        lw         $t0, -12($fp)
        li         $t1, 0
        addu       $t0,$t1
        lw         $t2, 4($fp)
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                IntValue(4))),
#      IntValue(0))
#
        lw         $t0, -12($fp)
        li         $t1, 4
        addu       $t0,$t1
        li         $t2, 0
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                IntValue(8))),
#      IntValue(0))
#
        lw         $t0, -12($fp)
        li         $t1, 8
        addu       $t0,$t1
        li         $t2, 0
        sw         $t2, ($t0)
#
# Move(Reg("a0"), Mem(Binop("PLUS", Reg("fp"), IntValue(-12))))
#
        lw         $a0,-12($fp)
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
# Label("readtree_9")
#
readtree_9:
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
# Move(Reg("sp"), Binop("PLUS", Reg("sp"), IntValue(-24)))
#
        li         $t0, -24
        addu       $sp,$t0
        move       $sp,$sp
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-12))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -12($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-16))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -16($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-20))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -20($fp)
#
# Label("loop_10")
#
loop_10:
#
# CJump(Unop("NOT",
#            Binop("LT",
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                  Mem(Binop("PLUS",
#                            Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                            IntValue(-12))))),
#       "exit_11")
#
        lw         $t0, -12($fp)
        lw         $t1, -8($fp)
        li         $t2, -12
        addu       $t1,$t2
        lw         $t1
        blt        $t0,$t1
        seq        $t0,$t0, 0
        beq        $t0, 1, exit_11
#
# SystemCall("READ_INT", Mem(Binop("PLUS", Reg("fp"), IntValue(-20))))
#
        lw         $t0, -20($fp)
        move       $a0,$t0
        li         $v0,()
        syscall
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#      Call("insert_1",
#           Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#           List(Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-20))))))
#
        subu       $sp, $sp, 8
        lw         $t0, -16($fp)
        sw         $t0, 8($sp)
        lw         $t0, -20($fp)
        sw         $t0, 4($sp)
        lw         $t0, -8($fp)
        move       $v0, $t0
        jal        insert_1
        addu       $sp, $sp, 8
        move       $t0, $a0
        sw         $t0, -16($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-12))), IntValue(1)))
#
        lw         $t0, -12($fp)
        li         $t1, 1
        addu       $t0,$t1
        sw         $t0, -12($fp)
#
# Jump("loop_10")
#
        jr         loop_10
#
# Label("exit_11")
#
exit_11:
#
# Move(Reg("a0"), Mem(Binop("PLUS", Reg("fp"), IntValue(-16))))
#
        lw         $a0,-16($fp)
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
# Label("writetree_12")
#
writetree_12:
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
# CJump(Binop("EQ", Mem(Binop("PLUS", Reg("fp"), IntValue(4))), IntValue(0)),
#       "exit_14")
#
        lw         $t0, 4($fp)
        li         $t1, 0
        beq        $t0,$t1
        beq        $t0, 1, exit_14
#
# Assert(Binop("NEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(4))), IntValue(0)))
#
        lw         $t0, 4($fp)
        li         $t1, 0
        bne        $t0,$t1
ASSERT_8:
        li         $v0,8
        beq        $t0, 0, AssertionFailure
#
# CallP("writetree_12",
#       Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#       List(Mem(Binop("PLUS",
#                      Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                      IntValue(4)))))
#
        subu       $sp, $sp, 4
        lw         $t0, 4($fp)
        li         $t1, 4
        addu       $t0,$t1
        lw         $t0
        sw         $t0, 4($sp)
        lw         $t0, -8($fp)
        move       $v0, $t0
        jal        writetree_12
        addu       $sp, $sp, 4
        move       $t0, $a0
#
# Assert(Binop("NEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(4))), IntValue(0)))
#
        lw         $t0, 4($fp)
        li         $t1, 0
        bne        $t0,$t1
ASSERT_9:
        li         $v0,9
        beq        $t0, 0, AssertionFailure
#
# SystemCall("WRITE_INT",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                      IntValue(0))))
#
        lw         $t0, 4($fp)
        li         $t1, 0
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
# Assert(Binop("NEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(4))), IntValue(0)))
#
        lw         $t0, 4($fp)
        li         $t1, 0
        bne        $t0,$t1
ASSERT_10:
        li         $v0,10
        beq        $t0, 0, AssertionFailure
#
# CallP("writetree_12",
#       Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#       List(Mem(Binop("PLUS",
#                      Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                      IntValue(8)))))
#
        subu       $sp, $sp, 4
        lw         $t0, 4($fp)
        li         $t1, 8
        addu       $t0,$t1
        lw         $t0
        sw         $t0, 4($sp)
        lw         $t0, -8($fp)
        move       $v0, $t0
        jal        writetree_12
        addu       $sp, $sp, 4
        move       $t0, $a0
#
# Jump("cont_13")
#
        jr         cont_13
#
# Label("exit_14")
#
exit_14:
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
# Label("cont_13")
#
cont_13:
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
# Move(Reg("sp"), Binop("PLUS", Reg("sp"), IntValue(-20)))
#
        li         $t0, -20
        addu       $sp,$t0
        move       $sp,$sp
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-12))), IntValue(9))
#
        li         $t0, 9
        sw         $t0, -12($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-16))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -16($fp)
#
# SystemCall("WRITE_STRING", StringValue("Give "))
#
        li         $t0, Give 
        move       $a0,$t0
        li         $v0,4
        syscall
#
# SystemCall("WRITE_INT", Mem(Binop("PLUS", Reg("fp"), IntValue(-12))))
#
        lw         $t0, -12($fp)
        move       $a0,$t0
        li         $v0,1
        syscall
#
# SystemCall("WRITE_STRING", StringValue("numbers:"))
#
        li         $t0,  numbers:
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
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#      Call("readtree_9", Reg("fp"), List()))
#
        move       $v0, $fp
        jal        readtree_9
        move       $t0, $a0
        sw         $t0, -16($fp)
#
# SystemCall("WRITE_STRING", StringValue("Result:"))
#
        li         $t0, Result:
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
# CallP("writetree_12",
#       Reg("fp"),
#       List(Mem(Binop("PLUS", Reg("fp"), IntValue(-16)))))
#
        subu       $sp, $sp, 4
        lw         $t0, -16($fp)
        sw         $t0, 4($sp)
        move       $v0, $fp
        jal        writetree_12
        addu       $sp, $sp, 4
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
