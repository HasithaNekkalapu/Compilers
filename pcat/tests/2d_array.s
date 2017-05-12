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
# Move(Reg("sp"), Binop("PLUS", Reg("sp"), IntValue(-44)))
#
        li         $t0, -44
        addu       $sp,$t0
        move       $sp,$sp
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-20))),
#      Allocate(Binop("PLUS",
#                     Binop("PLUS",
#                           Binop("PLUS", IntValue(0), IntValue(2)),
#                           IntValue(2)),
#                     IntValue(1))))
#
        li         $t0, 0
        li         $t1, 2
        addu       $t0,$t1
        li         $t2, 2
        addu       $t0,$t2
        li         $t3, 1
        addu       $t0,$t3
        li         $t4, 4
        mult       $t0,$t4
        move       $t5, $gp
        addu       $gp, $gp, $t0
        sw         $t5, -20($fp)
#
# Move(Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-20)))),
#      Binop("PLUS", Binop("PLUS", IntValue(0), IntValue(2)), IntValue(2)))
#
        lw         $t0, -20($fp)
        li         $t1, 0
        li         $t2, 2
        addu       $t1,$t2
        li         $t3, 2
        addu       $t1,$t3
        sw         $t1, ($t0)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-24))), IntValue(4))
#
        li         $t0, 4
        sw         $t0, -24($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-28))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -28($fp)
#
# Label("loop_4")
#
loop_4:
#
# CJump(Binop("GEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(-28))), IntValue(2)),
#       "exit_5")
#
        lw         $t0, -28($fp)
        li         $t1, 2
        bge        $t0,$t1
        beq        $t0, 1, exit_5
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-20))),
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-24))))),
#      IntValue(1))
#
        lw         $t0, -20($fp)
        lw         $t1, -24($fp)
        addu       $t0,$t1
        li         $t2, 1
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-24))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-24))), IntValue(4)))
#
        lw         $t0, -24($fp)
        li         $t1, 4
        addu       $t0,$t1
        sw         $t0, -24($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-28))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-28))), IntValue(1)))
#
        lw         $t0, -28($fp)
        li         $t1, 1
        addu       $t0,$t1
        sw         $t0, -28($fp)
#
# Jump("loop_4")
#
        jr         loop_4
#
# Label("exit_5")
#
exit_5:
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-28))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -28($fp)
#
# Label("loop_6")
#
loop_6:
#
# CJump(Binop("GEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(-28))), IntValue(2)),
#       "exit_7")
#
        lw         $t0, -28($fp)
        li         $t1, 2
        bge        $t0,$t1
        beq        $t0, 1, exit_7
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-20))),
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-24))))),
#      IntValue(2))
#
        lw         $t0, -20($fp)
        lw         $t1, -24($fp)
        addu       $t0,$t1
        li         $t2, 2
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-24))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-24))), IntValue(4)))
#
        lw         $t0, -24($fp)
        li         $t1, 4
        addu       $t0,$t1
        sw         $t0, -24($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-28))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-28))), IntValue(1)))
#
        lw         $t0, -28($fp)
        li         $t1, 1
        addu       $t0,$t1
        sw         $t0, -28($fp)
#
# Jump("loop_6")
#
        jr         loop_6
#
# Label("exit_7")
#
exit_7:
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#      Mem(Binop("PLUS", Reg("fp"), IntValue(-20))))
#
        lw         $t0, -20($fp)
        sw         $t0, -12($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-32))),
#      Allocate(Binop("PLUS",
#                     Binop("PLUS", IntValue(0), IntValue(2)),
#                     IntValue(1))))
#
        li         $t0, 0
        li         $t1, 2
        addu       $t0,$t1
        li         $t2, 1
        addu       $t0,$t2
        li         $t3, 4
        mult       $t0,$t3
        move       $t4, $gp
        addu       $gp, $gp, $t0
        sw         $t4, -32($fp)
#
# Move(Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-32)))),
#      Binop("PLUS", IntValue(0), IntValue(2)))
#
        lw         $t0, -32($fp)
        li         $t1, 0
        li         $t2, 2
        addu       $t1,$t2
        sw         $t1, ($t0)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-36))), IntValue(4))
#
        li         $t0, 4
        sw         $t0, -36($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-40))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -40($fp)
#
# Label("loop_11")
#
loop_11:
#
# CJump(Binop("GEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(-40))), IntValue(2)),
#       "exit_12")
#
        lw         $t0, -40($fp)
        li         $t1, 2
        bge        $t0,$t1
        beq        $t0, 1, exit_12
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-32))),
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-36))))),
#      Mem(Binop("PLUS", Reg("fp"), IntValue(-12))))
#
        lw         $t0, -32($fp)
        lw         $t1, -36($fp)
        addu       $t0,$t1
        lw         $t2, -12($fp)
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-36))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-36))), IntValue(4)))
#
        lw         $t0, -36($fp)
        li         $t1, 4
        addu       $t0,$t1
        sw         $t0, -36($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-40))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-40))), IntValue(1)))
#
        lw         $t0, -40($fp)
        li         $t1, 1
        addu       $t0,$t1
        sw         $t0, -40($fp)
#
# Jump("loop_11")
#
        jr         loop_11
#
# Label("exit_12")
#
exit_12:
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#      Mem(Binop("PLUS", Reg("fp"), IntValue(-32))))
#
        lw         $t0, -32($fp)
        sw         $t0, -16($fp)
#
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(1), IntValue(0)),
#              Binop("LT",
#                    IntValue(1),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-16)))))))
#
        li         $t0, 1
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_1
        li         $t2, 1
        lw         $t3, -16($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_1:
ASSERT_1:
        li         $v0,1
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(0), IntValue(0)),
#              Binop("LT",
#                    IntValue(0),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                                  Binop("TIMES",
#                                        Binop("PLUS", IntValue(1), IntValue(1)),
#                                        IntValue(4))))))))
#
        li         $t0, 0
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_2
        li         $t2, 0
        lw         $t3, -16($fp)
        li         $t4, 1
        li         $t5, 1
        addu       $t4,$t5
        li         $t6, 4
        mult       $t4,$t6
        addu       $t3,$t4
        lw         $t3
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_2:
ASSERT_2:
        li         $v0,2
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(1), IntValue(0)),
#              Binop("LT",
#                    IntValue(1),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-16)))))))
#
        li         $t0, 1
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_3
        li         $t2, 1
        lw         $t3, -16($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_3:
ASSERT_3:
        li         $v0,3
        beq        $t0, 0, AssertionFailure
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                          Binop("TIMES",
#                                Binop("PLUS", IntValue(1), IntValue(1)),
#                                IntValue(4)))),
#                Binop("TIMES",
#                      Binop("PLUS", IntValue(0), IntValue(1)),
#                      IntValue(4)))),
#      IntValue(10))
#
        lw         $t0, -16($fp)
        li         $t1, 1
        li         $t2, 1
        addu       $t1,$t2
        li         $t3, 4
        mult       $t1,$t3
        addu       $t0,$t1
        lw         $t0
        li         $t4, 0
        li         $t5, 1
        addu       $t4,$t5
        li         $t6, 4
        mult       $t4,$t6
        addu       $t0,$t4
        li         $t7, 10
        sw         $t7, ($t0)
#
# SystemCall("WRITE_STRING", StringValue("b[0][0] is "))
#
        li         $t0, b[0][0] is 
        move       $a0,$t0
        li         $v0,4
        syscall
#
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(0), IntValue(0)),
#              Binop("LT",
#                    IntValue(0),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-16)))))))
#
        li         $t0, 0
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_4
        li         $t2, 0
        lw         $t3, -16($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_4:
ASSERT_4:
        li         $v0,4
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(0), IntValue(0)),
#              Binop("LT",
#                    IntValue(0),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                                  Binop("TIMES",
#                                        Binop("PLUS", IntValue(0), IntValue(1)),
#                                        IntValue(4))))))))
#
        li         $t0, 0
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_5
        li         $t2, 0
        lw         $t3, -16($fp)
        li         $t4, 0
        li         $t5, 1
        addu       $t4,$t5
        li         $t6, 4
        mult       $t4,$t6
        addu       $t3,$t4
        lw         $t3
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_5:
ASSERT_5:
        li         $v0,5
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(0), IntValue(0)),
#              Binop("LT",
#                    IntValue(0),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-16)))))))
#
        li         $t0, 0
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_6
        li         $t2, 0
        lw         $t3, -16($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_6:
ASSERT_6:
        li         $v0,6
        beq        $t0, 0, AssertionFailure
#
# SystemCall("WRITE_INT",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                                Binop("TIMES",
#                                      Binop("PLUS", IntValue(0), IntValue(1)),
#                                      IntValue(4)))),
#                      Binop("TIMES",
#                            Binop("PLUS", IntValue(0), IntValue(1)),
#                            IntValue(4)))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        li         $t2, 1
        addu       $t1,$t2
        li         $t3, 4
        mult       $t1,$t3
        addu       $t0,$t1
        lw         $t0
        li         $t4, 0
        li         $t5, 1
        addu       $t4,$t5
        li         $t6, 4
        mult       $t4,$t6
        addu       $t0,$t4
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
# SystemCall("WRITE_STRING", StringValue("b[0][1] is "))
#
        li         $t0, b[0][1] is 
        move       $a0,$t0
        li         $v0,4
        syscall
#
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(0), IntValue(0)),
#              Binop("LT",
#                    IntValue(0),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-16)))))))
#
        li         $t0, 0
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_7
        li         $t2, 0
        lw         $t3, -16($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_7:
ASSERT_7:
        li         $v0,7
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(1), IntValue(0)),
#              Binop("LT",
#                    IntValue(1),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                                  Binop("TIMES",
#                                        Binop("PLUS", IntValue(0), IntValue(1)),
#                                        IntValue(4))))))))
#
        li         $t0, 1
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_8
        li         $t2, 1
        lw         $t3, -16($fp)
        li         $t4, 0
        li         $t5, 1
        addu       $t4,$t5
        li         $t6, 4
        mult       $t4,$t6
        addu       $t3,$t4
        lw         $t3
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_8:
ASSERT_8:
        li         $v0,8
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(0), IntValue(0)),
#              Binop("LT",
#                    IntValue(0),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-16)))))))
#
        li         $t0, 0
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_9
        li         $t2, 0
        lw         $t3, -16($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_9:
ASSERT_9:
        li         $v0,9
        beq        $t0, 0, AssertionFailure
#
# SystemCall("WRITE_INT",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                                Binop("TIMES",
#                                      Binop("PLUS", IntValue(0), IntValue(1)),
#                                      IntValue(4)))),
#                      Binop("TIMES",
#                            Binop("PLUS", IntValue(1), IntValue(1)),
#                            IntValue(4)))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        li         $t2, 1
        addu       $t1,$t2
        li         $t3, 4
        mult       $t1,$t3
        addu       $t0,$t1
        lw         $t0
        li         $t4, 1
        li         $t5, 1
        addu       $t4,$t5
        li         $t6, 4
        mult       $t4,$t6
        addu       $t0,$t4
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
# SystemCall("WRITE_STRING", StringValue("b[1][0] is "))
#
        li         $t0, b[1][0] is 
        move       $a0,$t0
        li         $v0,4
        syscall
#
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(1), IntValue(0)),
#              Binop("LT",
#                    IntValue(1),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-16)))))))
#
        li         $t0, 1
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_10
        li         $t2, 1
        lw         $t3, -16($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_10:
ASSERT_10:
        li         $v0,10
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(0), IntValue(0)),
#              Binop("LT",
#                    IntValue(0),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                                  Binop("TIMES",
#                                        Binop("PLUS", IntValue(1), IntValue(1)),
#                                        IntValue(4))))))))
#
        li         $t0, 0
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_11
        li         $t2, 0
        lw         $t3, -16($fp)
        li         $t4, 1
        li         $t5, 1
        addu       $t4,$t5
        li         $t6, 4
        mult       $t4,$t6
        addu       $t3,$t4
        lw         $t3
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_11:
ASSERT_11:
        li         $v0,11
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(1), IntValue(0)),
#              Binop("LT",
#                    IntValue(1),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-16)))))))
#
        li         $t0, 1
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_12
        li         $t2, 1
        lw         $t3, -16($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_12:
ASSERT_12:
        li         $v0,12
        beq        $t0, 0, AssertionFailure
#
# SystemCall("WRITE_INT",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                                Binop("TIMES",
#                                      Binop("PLUS", IntValue(1), IntValue(1)),
#                                      IntValue(4)))),
#                      Binop("TIMES",
#                            Binop("PLUS", IntValue(0), IntValue(1)),
#                            IntValue(4)))))
#
        lw         $t0, -16($fp)
        li         $t1, 1
        li         $t2, 1
        addu       $t1,$t2
        li         $t3, 4
        mult       $t1,$t3
        addu       $t0,$t1
        lw         $t0
        li         $t4, 0
        li         $t5, 1
        addu       $t4,$t5
        li         $t6, 4
        mult       $t4,$t6
        addu       $t0,$t4
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
# SystemCall("WRITE_STRING", StringValue("b[1][3] is "))
#
        li         $t0, b[1][3] is 
        move       $a0,$t0
        li         $v0,4
        syscall
#
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(1), IntValue(0)),
#              Binop("LT",
#                    IntValue(1),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-16)))))))
#
        li         $t0, 1
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_13
        li         $t2, 1
        lw         $t3, -16($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_13:
ASSERT_13:
        li         $v0,13
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(3), IntValue(0)),
#              Binop("LT",
#                    IntValue(3),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                                  Binop("TIMES",
#                                        Binop("PLUS", IntValue(1), IntValue(1)),
#                                        IntValue(4))))))))
#
        li         $t0, 3
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_14
        li         $t2, 3
        lw         $t3, -16($fp)
        li         $t4, 1
        li         $t5, 1
        addu       $t4,$t5
        li         $t6, 4
        mult       $t4,$t6
        addu       $t3,$t4
        lw         $t3
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_14:
ASSERT_14:
        li         $v0,14
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(1), IntValue(0)),
#              Binop("LT",
#                    IntValue(1),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-16)))))))
#
        li         $t0, 1
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_15
        li         $t2, 1
        lw         $t3, -16($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_15:
ASSERT_15:
        li         $v0,15
        beq        $t0, 0, AssertionFailure
#
# SystemCall("WRITE_INT",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                                Binop("TIMES",
#                                      Binop("PLUS", IntValue(1), IntValue(1)),
#                                      IntValue(4)))),
#                      Binop("TIMES",
#                            Binop("PLUS", IntValue(3), IntValue(1)),
#                            IntValue(4)))))
#
        lw         $t0, -16($fp)
        li         $t1, 1
        li         $t2, 1
        addu       $t1,$t2
        li         $t3, 4
        mult       $t1,$t3
        addu       $t0,$t1
        lw         $t0
        li         $t4, 3
        li         $t5, 1
        addu       $t4,$t5
        li         $t6, 4
        mult       $t4,$t6
        addu       $t0,$t4
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
