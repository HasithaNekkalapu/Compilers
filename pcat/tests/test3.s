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
# Move(Reg("sp"), Binop("PLUS", Reg("sp"), IntValue(-36)))
#
        li         $t0, -36
        addu       $sp,$t0
        move       $sp,$sp
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-24))),
#      Allocate(Binop("PLUS",
#                     Binop("PLUS",
#                           Binop("PLUS",
#                                 Binop("PLUS",
#                                       Binop("PLUS",
#                                             Binop("PLUS",
#                                                   IntValue(0),
#                                                   IntValue(2)),
#                                             IntValue(1)),
#                                       IntValue(1)),
#                                 IntValue(4)),
#                           IntValue(1)),
#                     IntValue(1))))
#
        li         $t0, 0
        li         $t1, 2
        addu       $t0,$t1
        li         $t2, 1
        addu       $t0,$t2
        li         $t3, 1
        addu       $t0,$t3
        li         $t4, 4
        addu       $t0,$t4
        li         $t5, 1
        addu       $t0,$t5
        li         $t6, 1
        addu       $t0,$t6
        li         $t7, 4
        mult       $t0,$t7
        move       $t8, $gp
        addu       $gp, $gp, $t0
        sw         $t8, -24($fp)
#
# Move(Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-24)))),
#      Binop("PLUS",
#            Binop("PLUS",
#                  Binop("PLUS",
#                        Binop("PLUS",
#                              Binop("PLUS", IntValue(0), IntValue(2)),
#                              IntValue(1)),
#                        IntValue(1)),
#                  IntValue(4)),
#            IntValue(1)))
#
        lw         $t0, -24($fp)
        li         $t1, 0
        li         $t2, 2
        addu       $t1,$t2
        li         $t3, 1
        addu       $t1,$t3
        li         $t4, 1
        addu       $t1,$t4
        li         $t5, 4
        addu       $t1,$t5
        li         $t6, 1
        addu       $t1,$t6
        sw         $t1, ($t0)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-28))), IntValue(4))
#
        li         $t0, 4
        sw         $t0, -28($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-32))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -32($fp)
#
# Label("loop_10")
#
loop_10:
#
# CJump(Binop("GEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(-32))), IntValue(2)),
#       "exit_11")
#
        lw         $t0, -32($fp)
        li         $t1, 2
        bge        $t0,$t1
        beq        $t0, 1, exit_11
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-24))),
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-28))))),
#      IntValue(1))
#
        lw         $t0, -24($fp)
        lw         $t1, -28($fp)
        addu       $t0,$t1
        li         $t2, 1
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-28))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-28))), IntValue(4)))
#
        lw         $t0, -28($fp)
        li         $t1, 4
        addu       $t0,$t1
        sw         $t0, -28($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-32))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-32))), IntValue(1)))
#
        lw         $t0, -32($fp)
        li         $t1, 1
        addu       $t0,$t1
        sw         $t0, -32($fp)
#
# Jump("loop_10")
#
        jr         loop_10
#
# Label("exit_11")
#
exit_11:
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-24))),
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-28))))),
#      IntValue(2))
#
        lw         $t0, -24($fp)
        lw         $t1, -28($fp)
        addu       $t0,$t1
        li         $t2, 2
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-28))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-28))), IntValue(4)))
#
        lw         $t0, -28($fp)
        li         $t1, 4
        addu       $t0,$t1
        sw         $t0, -28($fp)
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-24))),
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-28))))),
#      IntValue(5))
#
        lw         $t0, -24($fp)
        lw         $t1, -28($fp)
        addu       $t0,$t1
        li         $t2, 5
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-28))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-28))), IntValue(4)))
#
        lw         $t0, -28($fp)
        li         $t1, 4
        addu       $t0,$t1
        sw         $t0, -28($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-32))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -32($fp)
#
# Label("loop_12")
#
loop_12:
#
# CJump(Binop("GEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(-32))), IntValue(4)),
#       "exit_13")
#
        lw         $t0, -32($fp)
        li         $t1, 4
        bge        $t0,$t1
        beq        $t0, 1, exit_13
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-24))),
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-28))))),
#      IntValue(6))
#
        lw         $t0, -24($fp)
        lw         $t1, -28($fp)
        addu       $t0,$t1
        li         $t2, 6
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-28))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-28))), IntValue(4)))
#
        lw         $t0, -28($fp)
        li         $t1, 4
        addu       $t0,$t1
        sw         $t0, -28($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-32))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-32))), IntValue(1)))
#
        lw         $t0, -32($fp)
        li         $t1, 1
        addu       $t0,$t1
        sw         $t0, -32($fp)
#
# Jump("loop_12")
#
        jr         loop_12
#
# Label("exit_13")
#
exit_13:
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-24))),
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-28))))),
#      IntValue(100))
#
        lw         $t0, -24($fp)
        lw         $t1, -28($fp)
        addu       $t0,$t1
        li         $t2, 100
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-28))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-28))), IntValue(4)))
#
        lw         $t0, -28($fp)
        li         $t1, 4
        addu       $t0,$t1
        sw         $t0, -28($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#      Mem(Binop("PLUS", Reg("fp"), IntValue(-24))))
#
        lw         $t0, -24($fp)
        sw         $t0, -12($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-16))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -16($fp)
#
# Move(Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-20)))), IntValue(0))
#
        lw         $t0, -20($fp)
        li         $t1, 0
        sw         $t1, ($t0)
#
# Label("loop_1")
#
loop_1:
#
# CJump(Binop("GT", Mem(Binop("PLUS", Reg("fp"), IntValue(-20))), IntValue(8)),
#       "exit_2")
#
        lw         $t0, -20($fp)
        li         $t1, 8
        bgt        $t0,$t1
        beq        $t0, 1, exit_2
#
# SystemCall("WRITE_STRING", StringValue("a["))
#
        li         $t0, a[
        move       $a0,$t0
        li         $v0,4
        syscall
#
# SystemCall("WRITE_INT", Mem(Binop("PLUS", Reg("fp"), IntValue(-20))))
#
        lw         $t0, -20($fp)
        move       $a0,$t0
        li         $v0,1
        syscall
#
# SystemCall("WRITE_STRING", StringValue("] is "))
#
        li         $t0, ] is 
        move       $a0,$t0
        li         $v0,4
        syscall
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-20))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-20))),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-12)))))))
#
        lw         $t0, -20($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_1
        lw         $t2, -20($fp)
        lw         $t3, -12($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_1:
ASSERT_1:
        li         $v0,1
        beq        $t0, 0, AssertionFailure
#
# SystemCall("WRITE_INT",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                      Binop("TIMES",
#                            Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-20))),
#                                  IntValue(1)),
#                            IntValue(4)))))
#
        lw         $t0, -12($fp)
        lw         $t1, -20($fp)
        li         $t2, 1
        addu       $t1,$t2
        li         $t3, 4
        mult       $t1,$t3
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
# Move(Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-20)))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-20))), IntValue(1)))
#
        lw         $t0, -20($fp)
        lw         $t1, -20($fp)
        li         $t2, 1
        addu       $t1,$t2
        sw         $t1, ($t0)
#
# Jump("loop_1")
#
        jr         loop_1
#
# Label("exit_2")
#
exit_2:
#
# Label("loop_3")
#
loop_3:
#
# CJump(Unop("NOT",
#            Binop("LT",
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                  IntValue(12))),
#       "exit_4")
#
        lw         $t0, -16($fp)
        li         $t1, 12
        blt        $t0,$t1
        seq        $t0,$t0, 0
        beq        $t0, 1, exit_4
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-12)))))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_2
        lw         $t2, -16($fp)
        lw         $t3, -12($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_2:
ASSERT_2:
        li         $v0,2
        beq        $t0, 0, AssertionFailure
#
# CJump(Binop("AND",
#             Binop("LT",
#                   Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                   IntValue(9)),
#             Binop("LT",
#                   Mem(Binop("PLUS",
#                             Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                             Binop("TIMES",
#                                   Binop("PLUS",
#                                         Mem(Binop("PLUS",
#                                                   Reg("fp"),
#                                                   IntValue(-16))),
#                                         IntValue(1)),
#                                   IntValue(4)))),
#                   IntValue(10))),
#       "exit_6")
#
        lw         $t0, -16($fp)
        li         $t1, 9
        blt        $t0,$t1
        beq        $t0, 0, L_3
        lw         $t2, -12($fp)
        lw         $t3, -16($fp)
        li         $t4, 1
        addu       $t3,$t4
        li         $t5, 4
        mult       $t3,$t5
        addu       $t2,$t3
        lw         $t2
        li         $t6, 10
        blt        $t2,$t6
        move       $t0, $t2
L_3:
        beq        $t0, 1, exit_6
#
# Jump("cont_5")
#
        jr         cont_5
#
# Label("exit_6")
#
exit_6:
#
# SystemCall("WRITE_INT", Mem(Binop("PLUS", Reg("fp"), IntValue(-16))))
#
        lw         $t0, -16($fp)
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
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-12)))))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_4
        lw         $t2, -16($fp)
        lw         $t3, -12($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_4:
ASSERT_3:
        li         $v0,3
        beq        $t0, 0, AssertionFailure
#
# SystemCall("WRITE_INT",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                      Binop("TIMES",
#                            Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                                  IntValue(1)),
#                            IntValue(4)))))
#
        lw         $t0, -12($fp)
        lw         $t1, -16($fp)
        li         $t2, 1
        addu       $t1,$t2
        li         $t3, 4
        mult       $t1,$t3
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
# Label("cont_5")
#
cont_5:
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-16))), IntValue(1)))
#
        lw         $t0, -16($fp)
        li         $t1, 1
        addu       $t0,$t1
        sw         $t0, -16($fp)
#
# Jump("loop_3")
#
        jr         loop_3
#
# Label("exit_4")
#
exit_4:
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
