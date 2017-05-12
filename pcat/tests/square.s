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
# Move(Reg("sp"), Binop("PLUS", Reg("sp"), IntValue(-104)))
#
        li         $t0, -104
        addu       $sp,$t0
        move       $sp,$sp
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-12))), IntValue(5))
#
        li         $t0, 5
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
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-24))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -24($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-28))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -28($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-44))),
#      Allocate(Binop("PLUS",
#                     Binop("PLUS",
#                           IntValue(0),
#                           Mem(Binop("PLUS", Reg("fp"), IntValue(-12)))),
#                     IntValue(1))))
#
        li         $t0, 0
        lw         $t1, -12($fp)
        addu       $t0,$t1
        li         $t2, 1
        addu       $t0,$t2
        li         $t3, 4
        mult       $t0,$t3
        move       $t4, $gp
        addu       $gp, $gp, $t0
        sw         $t4, -44($fp)
#
# Move(Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-44)))),
#      Binop("PLUS", IntValue(0), Mem(Binop("PLUS", Reg("fp"), IntValue(-12)))))
#
        lw         $t0, -44($fp)
        li         $t1, 0
        lw         $t2, -12($fp)
        addu       $t1,$t2
        sw         $t1, ($t0)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-48))), IntValue(4))
#
        li         $t0, 4
        sw         $t0, -48($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-52))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -52($fp)
#
# Label("loop_16")
#
loop_16:
#
# CJump(Binop("GEQ",
#             Mem(Binop("PLUS", Reg("fp"), IntValue(-52))),
#             Mem(Binop("PLUS", Reg("fp"), IntValue(-12)))),
#       "exit_17")
#
        lw         $t0, -52($fp)
        lw         $t1, -12($fp)
        bge        $t0,$t1
        beq        $t0, 1, exit_17
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-44))),
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-48))))),
#      IntValue(0))
#
        lw         $t0, -44($fp)
        lw         $t1, -48($fp)
        addu       $t0,$t1
        li         $t2, 0
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-48))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-48))), IntValue(4)))
#
        lw         $t0, -48($fp)
        li         $t1, 4
        addu       $t0,$t1
        sw         $t0, -48($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-52))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-52))), IntValue(1)))
#
        lw         $t0, -52($fp)
        li         $t1, 1
        addu       $t0,$t1
        sw         $t0, -52($fp)
#
# Jump("loop_16")
#
        jr         loop_16
#
# Label("exit_17")
#
exit_17:
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-32))),
#      Mem(Binop("PLUS", Reg("fp"), IntValue(-44))))
#
        lw         $t0, -44($fp)
        sw         $t0, -32($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-56))),
#      Allocate(Binop("PLUS",
#                     Binop("PLUS",
#                           IntValue(0),
#                           Mem(Binop("PLUS", Reg("fp"), IntValue(-12)))),
#                     IntValue(1))))
#
        li         $t0, 0
        lw         $t1, -12($fp)
        addu       $t0,$t1
        li         $t2, 1
        addu       $t0,$t2
        li         $t3, 4
        mult       $t0,$t3
        move       $t4, $gp
        addu       $gp, $gp, $t0
        sw         $t4, -56($fp)
#
# Move(Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-56)))),
#      Binop("PLUS", IntValue(0), Mem(Binop("PLUS", Reg("fp"), IntValue(-12)))))
#
        lw         $t0, -56($fp)
        li         $t1, 0
        lw         $t2, -12($fp)
        addu       $t1,$t2
        sw         $t1, ($t0)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-60))), IntValue(4))
#
        li         $t0, 4
        sw         $t0, -60($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-64))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -64($fp)
#
# Label("loop_26")
#
loop_26:
#
# CJump(Binop("GEQ",
#             Mem(Binop("PLUS", Reg("fp"), IntValue(-64))),
#             Mem(Binop("PLUS", Reg("fp"), IntValue(-12)))),
#       "exit_27")
#
        lw         $t0, -64($fp)
        lw         $t1, -12($fp)
        bge        $t0,$t1
        beq        $t0, 1, exit_27
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-68))),
#      Allocate(Binop("PLUS",
#                     Binop("PLUS",
#                           IntValue(0),
#                           Mem(Binop("PLUS", Reg("fp"), IntValue(-12)))),
#                     IntValue(1))))
#
        li         $t0, 0
        lw         $t1, -12($fp)
        addu       $t0,$t1
        li         $t2, 1
        addu       $t0,$t2
        li         $t3, 4
        mult       $t0,$t3
        move       $t4, $gp
        addu       $gp, $gp, $t0
        sw         $t4, -68($fp)
#
# Move(Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-68)))),
#      Binop("PLUS", IntValue(0), Mem(Binop("PLUS", Reg("fp"), IntValue(-12)))))
#
        lw         $t0, -68($fp)
        li         $t1, 0
        lw         $t2, -12($fp)
        addu       $t1,$t2
        sw         $t1, ($t0)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-72))), IntValue(4))
#
        li         $t0, 4
        sw         $t0, -72($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-76))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -76($fp)
#
# Label("loop_24")
#
loop_24:
#
# CJump(Binop("GEQ",
#             Mem(Binop("PLUS", Reg("fp"), IntValue(-76))),
#             Mem(Binop("PLUS", Reg("fp"), IntValue(-12)))),
#       "exit_25")
#
        lw         $t0, -76($fp)
        lw         $t1, -12($fp)
        bge        $t0,$t1
        beq        $t0, 1, exit_25
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-68))),
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-72))))),
#      IntValue(0))
#
        lw         $t0, -68($fp)
        lw         $t1, -72($fp)
        addu       $t0,$t1
        li         $t2, 0
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-72))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-72))), IntValue(4)))
#
        lw         $t0, -72($fp)
        li         $t1, 4
        addu       $t0,$t1
        sw         $t0, -72($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-76))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-76))), IntValue(1)))
#
        lw         $t0, -76($fp)
        li         $t1, 1
        addu       $t0,$t1
        sw         $t0, -76($fp)
#
# Jump("loop_24")
#
        jr         loop_24
#
# Label("exit_25")
#
exit_25:
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-56))),
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-60))))),
#      Mem(Binop("PLUS", Reg("fp"), IntValue(-68))))
#
        lw         $t0, -56($fp)
        lw         $t1, -60($fp)
        addu       $t0,$t1
        lw         $t2, -68($fp)
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-60))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-60))), IntValue(4)))
#
        lw         $t0, -60($fp)
        li         $t1, 4
        addu       $t0,$t1
        sw         $t0, -60($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-64))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-64))), IntValue(1)))
#
        lw         $t0, -64($fp)
        li         $t1, 1
        addu       $t0,$t1
        sw         $t0, -64($fp)
#
# Jump("loop_26")
#
        jr         loop_26
#
# Label("exit_27")
#
exit_27:
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-36))),
#      Mem(Binop("PLUS", Reg("fp"), IntValue(-56))))
#
        lw         $t0, -56($fp)
        sw         $t0, -36($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-80))),
#      Allocate(Binop("PLUS",
#                     Binop("PLUS",
#                           IntValue(0),
#                           Mem(Binop("PLUS", Reg("fp"), IntValue(-12)))),
#                     IntValue(1))))
#
        li         $t0, 0
        lw         $t1, -12($fp)
        addu       $t0,$t1
        li         $t2, 1
        addu       $t0,$t2
        li         $t3, 4
        mult       $t0,$t3
        move       $t4, $gp
        addu       $gp, $gp, $t0
        sw         $t4, -80($fp)
#
# Move(Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-80)))),
#      Binop("PLUS", IntValue(0), Mem(Binop("PLUS", Reg("fp"), IntValue(-12)))))
#
        lw         $t0, -80($fp)
        li         $t1, 0
        lw         $t2, -12($fp)
        addu       $t1,$t2
        sw         $t1, ($t0)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-84))), IntValue(4))
#
        li         $t0, 4
        sw         $t0, -84($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-88))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -88($fp)
#
# Label("loop_36")
#
loop_36:
#
# CJump(Binop("GEQ",
#             Mem(Binop("PLUS", Reg("fp"), IntValue(-88))),
#             Mem(Binop("PLUS", Reg("fp"), IntValue(-12)))),
#       "exit_37")
#
        lw         $t0, -88($fp)
        lw         $t1, -12($fp)
        bge        $t0,$t1
        beq        $t0, 1, exit_37
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-92))),
#      Allocate(Binop("PLUS",
#                     Binop("PLUS",
#                           IntValue(0),
#                           Mem(Binop("PLUS", Reg("fp"), IntValue(-12)))),
#                     IntValue(1))))
#
        li         $t0, 0
        lw         $t1, -12($fp)
        addu       $t0,$t1
        li         $t2, 1
        addu       $t0,$t2
        li         $t3, 4
        mult       $t0,$t3
        move       $t4, $gp
        addu       $gp, $gp, $t0
        sw         $t4, -92($fp)
#
# Move(Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-92)))),
#      Binop("PLUS", IntValue(0), Mem(Binop("PLUS", Reg("fp"), IntValue(-12)))))
#
        lw         $t0, -92($fp)
        li         $t1, 0
        lw         $t2, -12($fp)
        addu       $t1,$t2
        sw         $t1, ($t0)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-96))), IntValue(4))
#
        li         $t0, 4
        sw         $t0, -96($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-100))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -100($fp)
#
# Label("loop_34")
#
loop_34:
#
# CJump(Binop("GEQ",
#             Mem(Binop("PLUS", Reg("fp"), IntValue(-100))),
#             Mem(Binop("PLUS", Reg("fp"), IntValue(-12)))),
#       "exit_35")
#
        lw         $t0, -100($fp)
        lw         $t1, -12($fp)
        bge        $t0,$t1
        beq        $t0, 1, exit_35
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-92))),
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-96))))),
#      IntValue(0))
#
        lw         $t0, -92($fp)
        lw         $t1, -96($fp)
        addu       $t0,$t1
        li         $t2, 0
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-96))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-96))), IntValue(4)))
#
        lw         $t0, -96($fp)
        li         $t1, 4
        addu       $t0,$t1
        sw         $t0, -96($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-100))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-100))), IntValue(1)))
#
        lw         $t0, -100($fp)
        li         $t1, 1
        addu       $t0,$t1
        sw         $t0, -100($fp)
#
# Jump("loop_34")
#
        jr         loop_34
#
# Label("exit_35")
#
exit_35:
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-80))),
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-84))))),
#      Mem(Binop("PLUS", Reg("fp"), IntValue(-92))))
#
        lw         $t0, -80($fp)
        lw         $t1, -84($fp)
        addu       $t0,$t1
        lw         $t2, -92($fp)
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-84))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-84))), IntValue(4)))
#
        lw         $t0, -84($fp)
        li         $t1, 4
        addu       $t0,$t1
        sw         $t0, -84($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-88))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-88))), IntValue(1)))
#
        lw         $t0, -88($fp)
        li         $t1, 1
        addu       $t0,$t1
        sw         $t0, -88($fp)
#
# Jump("loop_36")
#
        jr         loop_36
#
# Label("exit_37")
#
exit_37:
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-40))),
#      Mem(Binop("PLUS", Reg("fp"), IntValue(-80))))
#
        lw         $t0, -80($fp)
        sw         $t0, -40($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-16))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -16($fp)
#
# Label("loop_1")
#
loop_1:
#
# CJump(Unop("NOT",
#            Binop("LT",
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(-12))))),
#       "exit_2")
#
        lw         $t0, -16($fp)
        lw         $t1, -12($fp)
        blt        $t0,$t1
        seq        $t0,$t0, 0
        beq        $t0, 1, exit_2
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-36)))))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_1
        lw         $t2, -16($fp)
        lw         $t3, -36($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_1:
ASSERT_1:
        li         $v0,1
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-36))),
#                                  Binop("TIMES",
#                                        Binop("PLUS",
#                                              Mem(Binop("PLUS",
#                                                        Reg("fp"),
#                                                        IntValue(-16))),
#                                              IntValue(1)),
#                                        IntValue(4))))))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_2
        lw         $t2, -16($fp)
        lw         $t3, -36($fp)
        lw         $t4, -16($fp)
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
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-36)))))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_3
        lw         $t2, -16($fp)
        lw         $t3, -36($fp)
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
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(-36))),
#                          Binop("TIMES",
#                                Binop("PLUS",
#                                      Mem(Binop("PLUS",
#                                                Reg("fp"),
#                                                IntValue(-16))),
#                                      IntValue(1)),
#                                IntValue(4)))),
#                Binop("TIMES",
#                      Binop("PLUS",
#                            Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                            IntValue(1)),
#                      IntValue(4)))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-16))), IntValue(1)))
#
        lw         $t0, -36($fp)
        lw         $t1, -16($fp)
        li         $t2, 1
        addu       $t1,$t2
        li         $t3, 4
        mult       $t1,$t3
        addu       $t0,$t1
        lw         $t0
        lw         $t4, -16($fp)
        li         $t5, 1
        addu       $t4,$t5
        li         $t6, 4
        mult       $t4,$t6
        addu       $t0,$t4
        lw         $t7, -16($fp)
        li         $t8, 1
        addu       $t7,$t8
        sw         $t7, ($t0)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-16))), IntValue(1)))
#
        lw         $t0, -16($fp)
        li         $t1, 1
        addu       $t0,$t1
        sw         $t0, -16($fp)
#
# Jump("loop_1")
#
        jr         loop_1
#
# Label("exit_2")
#
exit_2:
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-16))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -16($fp)
#
# Label("loop_3")
#
loop_3:
#
# CJump(Unop("NOT",
#            Binop("LT",
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(-12))))),
#       "exit_4")
#
        lw         $t0, -16($fp)
        lw         $t1, -12($fp)
        blt        $t0,$t1
        seq        $t0,$t0, 0
        beq        $t0, 1, exit_4
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-20))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -20($fp)
#
# Label("loop_5")
#
loop_5:
#
# CJump(Unop("NOT",
#            Binop("LT",
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(-20))),
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(-12))))),
#       "exit_6")
#
        lw         $t0, -20($fp)
        lw         $t1, -12($fp)
        blt        $t0,$t1
        seq        $t0,$t0, 0
        beq        $t0, 1, exit_6
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-28))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -28($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-24))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -24($fp)
#
# Label("loop_7")
#
loop_7:
#
# CJump(Unop("NOT",
#            Binop("LT",
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(-24))),
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(-12))))),
#       "exit_8")
#
        lw         $t0, -24($fp)
        lw         $t1, -12($fp)
        blt        $t0,$t1
        seq        $t0,$t0, 0
        beq        $t0, 1, exit_8
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-36)))))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_4
        lw         $t2, -16($fp)
        lw         $t3, -36($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_4:
ASSERT_4:
        li         $v0,4
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-24))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-24))),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-36))),
#                                  Binop("TIMES",
#                                        Binop("PLUS",
#                                              Mem(Binop("PLUS",
#                                                        Reg("fp"),
#                                                        IntValue(-16))),
#                                              IntValue(1)),
#                                        IntValue(4))))))))
#
        lw         $t0, -24($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_5
        lw         $t2, -24($fp)
        lw         $t3, -36($fp)
        lw         $t4, -16($fp)
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
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-36)))))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_6
        lw         $t2, -16($fp)
        lw         $t3, -36($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_6:
ASSERT_6:
        li         $v0,6
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-24))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-24))),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-36)))))))
#
        lw         $t0, -24($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_7
        lw         $t2, -24($fp)
        lw         $t3, -36($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_7:
ASSERT_7:
        li         $v0,7
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-20))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-20))),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-36))),
#                                  Binop("TIMES",
#                                        Binop("PLUS",
#                                              Mem(Binop("PLUS",
#                                                        Reg("fp"),
#                                                        IntValue(-24))),
#                                              IntValue(1)),
#                                        IntValue(4))))))))
#
        lw         $t0, -20($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_8
        lw         $t2, -20($fp)
        lw         $t3, -36($fp)
        lw         $t4, -24($fp)
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
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-24))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-24))),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-36)))))))
#
        lw         $t0, -24($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_9
        lw         $t2, -24($fp)
        lw         $t3, -36($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_9:
ASSERT_9:
        li         $v0,9
        beq        $t0, 0, AssertionFailure
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-28))),
#      Binop("PLUS",
#            Mem(Binop("PLUS", Reg("fp"), IntValue(-28))),
#            Binop("TIMES",
#                  Mem(Binop("PLUS",
#                            Mem(Binop("PLUS",
#                                      Mem(Binop("PLUS",
#                                                Reg("fp"),
#                                                IntValue(-36))),
#                                      Binop("TIMES",
#                                            Binop("PLUS",
#                                                  Mem(Binop("PLUS",
#                                                            Reg("fp"),
#                                                            IntValue(-16))),
#                                                  IntValue(1)),
#                                            IntValue(4)))),
#                            Binop("TIMES",
#                                  Binop("PLUS",
#                                        Mem(Binop("PLUS",
#                                                  Reg("fp"),
#                                                  IntValue(-24))),
#                                        IntValue(1)),
#                                  IntValue(4)))),
#                  Mem(Binop("PLUS",
#                            Mem(Binop("PLUS",
#                                      Mem(Binop("PLUS",
#                                                Reg("fp"),
#                                                IntValue(-36))),
#                                      Binop("TIMES",
#                                            Binop("PLUS",
#                                                  Mem(Binop("PLUS",
#                                                            Reg("fp"),
#                                                            IntValue(-24))),
#                                                  IntValue(1)),
#                                            IntValue(4)))),
#                            Binop("TIMES",
#                                  Binop("PLUS",
#                                        Mem(Binop("PLUS",
#                                                  Reg("fp"),
#                                                  IntValue(-20))),
#                                        IntValue(1)),
#                                  IntValue(4)))))))
#
        lw         $t0, -28($fp)
        lw         $t1, -36($fp)
        lw         $t2, -16($fp)
        li         $t3, 1
        addu       $t2,$t3
        li         $t4, 4
        mult       $t2,$t4
        addu       $t1,$t2
        lw         $t1
        lw         $t5, -24($fp)
        li         $t6, 1
        addu       $t5,$t6
        li         $t7, 4
        mult       $t5,$t7
        addu       $t1,$t5
        lw         $t1
        lw         $t8, -36($fp)
        lw         $t9, -24($fp)
        li         $s0, 1
        addu       $t9,$s0
        li         $s1, 4
        mult       $t9,$s1
        addu       $t8,$t9
        lw         $t8
        lw         $s2, -20($fp)
        li         $s3, 1
        addu       $s2,$s3
        li         $s4, 4
        mult       $s2,$s4
        addu       $t8,$s2
        lw         $t8
        mult       $t1,$t8
        addu       $t0,$t1
        sw         $t0, -28($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-24))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-24))), IntValue(1)))
#
        lw         $t0, -24($fp)
        li         $t1, 1
        addu       $t0,$t1
        sw         $t0, -24($fp)
#
# Jump("loop_7")
#
        jr         loop_7
#
# Label("exit_8")
#
exit_8:
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-40)))))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_10
        lw         $t2, -16($fp)
        lw         $t3, -40($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_10:
ASSERT_10:
        li         $v0,10
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-20))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-20))),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-40))),
#                                  Binop("TIMES",
#                                        Binop("PLUS",
#                                              Mem(Binop("PLUS",
#                                                        Reg("fp"),
#                                                        IntValue(-16))),
#                                              IntValue(1)),
#                                        IntValue(4))))))))
#
        lw         $t0, -20($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_11
        lw         $t2, -20($fp)
        lw         $t3, -40($fp)
        lw         $t4, -16($fp)
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
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-40)))))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_12
        lw         $t2, -16($fp)
        lw         $t3, -40($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_12:
ASSERT_12:
        li         $v0,12
        beq        $t0, 0, AssertionFailure
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(-40))),
#                          Binop("TIMES",
#                                Binop("PLUS",
#                                      Mem(Binop("PLUS",
#                                                Reg("fp"),
#                                                IntValue(-16))),
#                                      IntValue(1)),
#                                IntValue(4)))),
#                Binop("TIMES",
#                      Binop("PLUS",
#                            Mem(Binop("PLUS", Reg("fp"), IntValue(-20))),
#                            IntValue(1)),
#                      IntValue(4)))),
#      Mem(Binop("PLUS", Reg("fp"), IntValue(-28))))
#
        lw         $t0, -40($fp)
        lw         $t1, -16($fp)
        li         $t2, 1
        addu       $t1,$t2
        li         $t3, 4
        mult       $t1,$t3
        addu       $t0,$t1
        lw         $t0
        lw         $t4, -20($fp)
        li         $t5, 1
        addu       $t4,$t5
        li         $t6, 4
        mult       $t4,$t6
        addu       $t0,$t4
        lw         $t7, -28($fp)
        sw         $t7, ($t0)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-20))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-20))), IntValue(1)))
#
        lw         $t0, -20($fp)
        li         $t1, 1
        addu       $t0,$t1
        sw         $t0, -20($fp)
#
# Jump("loop_5")
#
        jr         loop_5
#
# Label("exit_6")
#
exit_6:
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
# SystemCall("WRITE_STRING", StringValue("Input matrix"))
#
        li         $t0, Input matrix
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
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-16))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -16($fp)
#
# Label("loop_9")
#
loop_9:
#
# CJump(Unop("NOT",
#            Binop("LT",
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(-12))))),
#       "exit_10")
#
        lw         $t0, -16($fp)
        lw         $t1, -12($fp)
        blt        $t0,$t1
        seq        $t0,$t0, 0
        beq        $t0, 1, exit_10
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-36)))))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_13
        lw         $t2, -16($fp)
        lw         $t3, -36($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_13:
ASSERT_13:
        li         $v0,13
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(0), IntValue(0)),
#              Binop("LT",
#                    IntValue(0),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-36))),
#                                  Binop("TIMES",
#                                        Binop("PLUS",
#                                              Mem(Binop("PLUS",
#                                                        Reg("fp"),
#                                                        IntValue(-16))),
#                                              IntValue(1)),
#                                        IntValue(4))))))))
#
        li         $t0, 0
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_14
        li         $t2, 0
        lw         $t3, -36($fp)
        lw         $t4, -16($fp)
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
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-36)))))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_15
        lw         $t2, -16($fp)
        lw         $t3, -36($fp)
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
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-36))),
#                                Binop("TIMES",
#                                      Binop("PLUS",
#                                            Mem(Binop("PLUS",
#                                                      Reg("fp"),
#                                                      IntValue(-16))),
#                                            IntValue(1)),
#                                      IntValue(4)))),
#                      Binop("TIMES",
#                            Binop("PLUS", IntValue(0), IntValue(1)),
#                            IntValue(4)))))
#
        lw         $t0, -36($fp)
        lw         $t1, -16($fp)
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
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-36)))))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_16
        lw         $t2, -16($fp)
        lw         $t3, -36($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_16:
ASSERT_16:
        li         $v0,16
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(1), IntValue(0)),
#              Binop("LT",
#                    IntValue(1),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-36))),
#                                  Binop("TIMES",
#                                        Binop("PLUS",
#                                              Mem(Binop("PLUS",
#                                                        Reg("fp"),
#                                                        IntValue(-16))),
#                                              IntValue(1)),
#                                        IntValue(4))))))))
#
        li         $t0, 1
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_17
        li         $t2, 1
        lw         $t3, -36($fp)
        lw         $t4, -16($fp)
        li         $t5, 1
        addu       $t4,$t5
        li         $t6, 4
        mult       $t4,$t6
        addu       $t3,$t4
        lw         $t3
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_17:
ASSERT_17:
        li         $v0,17
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-36)))))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_18
        lw         $t2, -16($fp)
        lw         $t3, -36($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_18:
ASSERT_18:
        li         $v0,18
        beq        $t0, 0, AssertionFailure
#
# SystemCall("WRITE_INT",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-36))),
#                                Binop("TIMES",
#                                      Binop("PLUS",
#                                            Mem(Binop("PLUS",
#                                                      Reg("fp"),
#                                                      IntValue(-16))),
#                                            IntValue(1)),
#                                      IntValue(4)))),
#                      Binop("TIMES",
#                            Binop("PLUS", IntValue(1), IntValue(1)),
#                            IntValue(4)))))
#
        lw         $t0, -36($fp)
        lw         $t1, -16($fp)
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
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-36)))))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_19
        lw         $t2, -16($fp)
        lw         $t3, -36($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_19:
ASSERT_19:
        li         $v0,19
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(2), IntValue(0)),
#              Binop("LT",
#                    IntValue(2),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-36))),
#                                  Binop("TIMES",
#                                        Binop("PLUS",
#                                              Mem(Binop("PLUS",
#                                                        Reg("fp"),
#                                                        IntValue(-16))),
#                                              IntValue(1)),
#                                        IntValue(4))))))))
#
        li         $t0, 2
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_20
        li         $t2, 2
        lw         $t3, -36($fp)
        lw         $t4, -16($fp)
        li         $t5, 1
        addu       $t4,$t5
        li         $t6, 4
        mult       $t4,$t6
        addu       $t3,$t4
        lw         $t3
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_20:
ASSERT_20:
        li         $v0,20
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-36)))))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_21
        lw         $t2, -16($fp)
        lw         $t3, -36($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_21:
ASSERT_21:
        li         $v0,21
        beq        $t0, 0, AssertionFailure
#
# SystemCall("WRITE_INT",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-36))),
#                                Binop("TIMES",
#                                      Binop("PLUS",
#                                            Mem(Binop("PLUS",
#                                                      Reg("fp"),
#                                                      IntValue(-16))),
#                                            IntValue(1)),
#                                      IntValue(4)))),
#                      Binop("TIMES",
#                            Binop("PLUS", IntValue(2), IntValue(1)),
#                            IntValue(4)))))
#
        lw         $t0, -36($fp)
        lw         $t1, -16($fp)
        li         $t2, 1
        addu       $t1,$t2
        li         $t3, 4
        mult       $t1,$t3
        addu       $t0,$t1
        lw         $t0
        li         $t4, 2
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
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-36)))))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_22
        lw         $t2, -16($fp)
        lw         $t3, -36($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_22:
ASSERT_22:
        li         $v0,22
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(3), IntValue(0)),
#              Binop("LT",
#                    IntValue(3),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-36))),
#                                  Binop("TIMES",
#                                        Binop("PLUS",
#                                              Mem(Binop("PLUS",
#                                                        Reg("fp"),
#                                                        IntValue(-16))),
#                                              IntValue(1)),
#                                        IntValue(4))))))))
#
        li         $t0, 3
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_23
        li         $t2, 3
        lw         $t3, -36($fp)
        lw         $t4, -16($fp)
        li         $t5, 1
        addu       $t4,$t5
        li         $t6, 4
        mult       $t4,$t6
        addu       $t3,$t4
        lw         $t3
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_23:
ASSERT_23:
        li         $v0,23
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-36)))))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_24
        lw         $t2, -16($fp)
        lw         $t3, -36($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_24:
ASSERT_24:
        li         $v0,24
        beq        $t0, 0, AssertionFailure
#
# SystemCall("WRITE_INT",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-36))),
#                                Binop("TIMES",
#                                      Binop("PLUS",
#                                            Mem(Binop("PLUS",
#                                                      Reg("fp"),
#                                                      IntValue(-16))),
#                                            IntValue(1)),
#                                      IntValue(4)))),
#                      Binop("TIMES",
#                            Binop("PLUS", IntValue(3), IntValue(1)),
#                            IntValue(4)))))
#
        lw         $t0, -36($fp)
        lw         $t1, -16($fp)
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
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-36)))))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_25
        lw         $t2, -16($fp)
        lw         $t3, -36($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_25:
ASSERT_25:
        li         $v0,25
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(4), IntValue(0)),
#              Binop("LT",
#                    IntValue(4),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-36))),
#                                  Binop("TIMES",
#                                        Binop("PLUS",
#                                              Mem(Binop("PLUS",
#                                                        Reg("fp"),
#                                                        IntValue(-16))),
#                                              IntValue(1)),
#                                        IntValue(4))))))))
#
        li         $t0, 4
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_26
        li         $t2, 4
        lw         $t3, -36($fp)
        lw         $t4, -16($fp)
        li         $t5, 1
        addu       $t4,$t5
        li         $t6, 4
        mult       $t4,$t6
        addu       $t3,$t4
        lw         $t3
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_26:
ASSERT_26:
        li         $v0,26
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-36)))))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_27
        lw         $t2, -16($fp)
        lw         $t3, -36($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_27:
ASSERT_27:
        li         $v0,27
        beq        $t0, 0, AssertionFailure
#
# SystemCall("WRITE_INT",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-36))),
#                                Binop("TIMES",
#                                      Binop("PLUS",
#                                            Mem(Binop("PLUS",
#                                                      Reg("fp"),
#                                                      IntValue(-16))),
#                                            IntValue(1)),
#                                      IntValue(4)))),
#                      Binop("TIMES",
#                            Binop("PLUS", IntValue(4), IntValue(1)),
#                            IntValue(4)))))
#
        lw         $t0, -36($fp)
        lw         $t1, -16($fp)
        li         $t2, 1
        addu       $t1,$t2
        li         $t3, 4
        mult       $t1,$t3
        addu       $t0,$t1
        lw         $t0
        li         $t4, 4
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
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-16))), IntValue(1)))
#
        lw         $t0, -16($fp)
        li         $t1, 1
        addu       $t0,$t1
        sw         $t0, -16($fp)
#
# Jump("loop_9")
#
        jr         loop_9
#
# Label("exit_10")
#
exit_10:
#
# SystemCall("WRITE_STRING", StringValue("\n"))
#
        li         $t0, \n
        move       $a0,$t0
        li         $v0,4
        syscall
#
# SystemCall("WRITE_STRING", StringValue("Input matrix squared"))
#
        li         $t0, Input matrix squared
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
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-16))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -16($fp)
#
# Label("loop_11")
#
loop_11:
#
# CJump(Unop("NOT",
#            Binop("LT",
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(-12))))),
#       "exit_12")
#
        lw         $t0, -16($fp)
        lw         $t1, -12($fp)
        blt        $t0,$t1
        seq        $t0,$t0, 0
        beq        $t0, 1, exit_12
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-40)))))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_28
        lw         $t2, -16($fp)
        lw         $t3, -40($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_28:
ASSERT_28:
        li         $v0,28
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(0), IntValue(0)),
#              Binop("LT",
#                    IntValue(0),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-40))),
#                                  Binop("TIMES",
#                                        Binop("PLUS",
#                                              Mem(Binop("PLUS",
#                                                        Reg("fp"),
#                                                        IntValue(-16))),
#                                              IntValue(1)),
#                                        IntValue(4))))))))
#
        li         $t0, 0
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_29
        li         $t2, 0
        lw         $t3, -40($fp)
        lw         $t4, -16($fp)
        li         $t5, 1
        addu       $t4,$t5
        li         $t6, 4
        mult       $t4,$t6
        addu       $t3,$t4
        lw         $t3
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_29:
ASSERT_29:
        li         $v0,29
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-40)))))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_30
        lw         $t2, -16($fp)
        lw         $t3, -40($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_30:
ASSERT_30:
        li         $v0,30
        beq        $t0, 0, AssertionFailure
#
# SystemCall("WRITE_INT",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-40))),
#                                Binop("TIMES",
#                                      Binop("PLUS",
#                                            Mem(Binop("PLUS",
#                                                      Reg("fp"),
#                                                      IntValue(-16))),
#                                            IntValue(1)),
#                                      IntValue(4)))),
#                      Binop("TIMES",
#                            Binop("PLUS", IntValue(0), IntValue(1)),
#                            IntValue(4)))))
#
        lw         $t0, -40($fp)
        lw         $t1, -16($fp)
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
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-40)))))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_31
        lw         $t2, -16($fp)
        lw         $t3, -40($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_31:
ASSERT_31:
        li         $v0,31
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(1), IntValue(0)),
#              Binop("LT",
#                    IntValue(1),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-40))),
#                                  Binop("TIMES",
#                                        Binop("PLUS",
#                                              Mem(Binop("PLUS",
#                                                        Reg("fp"),
#                                                        IntValue(-16))),
#                                              IntValue(1)),
#                                        IntValue(4))))))))
#
        li         $t0, 1
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_32
        li         $t2, 1
        lw         $t3, -40($fp)
        lw         $t4, -16($fp)
        li         $t5, 1
        addu       $t4,$t5
        li         $t6, 4
        mult       $t4,$t6
        addu       $t3,$t4
        lw         $t3
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_32:
ASSERT_32:
        li         $v0,32
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-40)))))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_33
        lw         $t2, -16($fp)
        lw         $t3, -40($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_33:
ASSERT_33:
        li         $v0,33
        beq        $t0, 0, AssertionFailure
#
# SystemCall("WRITE_INT",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-40))),
#                                Binop("TIMES",
#                                      Binop("PLUS",
#                                            Mem(Binop("PLUS",
#                                                      Reg("fp"),
#                                                      IntValue(-16))),
#                                            IntValue(1)),
#                                      IntValue(4)))),
#                      Binop("TIMES",
#                            Binop("PLUS", IntValue(1), IntValue(1)),
#                            IntValue(4)))))
#
        lw         $t0, -40($fp)
        lw         $t1, -16($fp)
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
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-40)))))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_34
        lw         $t2, -16($fp)
        lw         $t3, -40($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_34:
ASSERT_34:
        li         $v0,34
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(2), IntValue(0)),
#              Binop("LT",
#                    IntValue(2),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-40))),
#                                  Binop("TIMES",
#                                        Binop("PLUS",
#                                              Mem(Binop("PLUS",
#                                                        Reg("fp"),
#                                                        IntValue(-16))),
#                                              IntValue(1)),
#                                        IntValue(4))))))))
#
        li         $t0, 2
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_35
        li         $t2, 2
        lw         $t3, -40($fp)
        lw         $t4, -16($fp)
        li         $t5, 1
        addu       $t4,$t5
        li         $t6, 4
        mult       $t4,$t6
        addu       $t3,$t4
        lw         $t3
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_35:
ASSERT_35:
        li         $v0,35
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-40)))))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_36
        lw         $t2, -16($fp)
        lw         $t3, -40($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_36:
ASSERT_36:
        li         $v0,36
        beq        $t0, 0, AssertionFailure
#
# SystemCall("WRITE_INT",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-40))),
#                                Binop("TIMES",
#                                      Binop("PLUS",
#                                            Mem(Binop("PLUS",
#                                                      Reg("fp"),
#                                                      IntValue(-16))),
#                                            IntValue(1)),
#                                      IntValue(4)))),
#                      Binop("TIMES",
#                            Binop("PLUS", IntValue(2), IntValue(1)),
#                            IntValue(4)))))
#
        lw         $t0, -40($fp)
        lw         $t1, -16($fp)
        li         $t2, 1
        addu       $t1,$t2
        li         $t3, 4
        mult       $t1,$t3
        addu       $t0,$t1
        lw         $t0
        li         $t4, 2
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
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-40)))))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_37
        lw         $t2, -16($fp)
        lw         $t3, -40($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_37:
ASSERT_37:
        li         $v0,37
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(3), IntValue(0)),
#              Binop("LT",
#                    IntValue(3),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-40))),
#                                  Binop("TIMES",
#                                        Binop("PLUS",
#                                              Mem(Binop("PLUS",
#                                                        Reg("fp"),
#                                                        IntValue(-16))),
#                                              IntValue(1)),
#                                        IntValue(4))))))))
#
        li         $t0, 3
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_38
        li         $t2, 3
        lw         $t3, -40($fp)
        lw         $t4, -16($fp)
        li         $t5, 1
        addu       $t4,$t5
        li         $t6, 4
        mult       $t4,$t6
        addu       $t3,$t4
        lw         $t3
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_38:
ASSERT_38:
        li         $v0,38
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-40)))))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_39
        lw         $t2, -16($fp)
        lw         $t3, -40($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_39:
ASSERT_39:
        li         $v0,39
        beq        $t0, 0, AssertionFailure
#
# SystemCall("WRITE_INT",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-40))),
#                                Binop("TIMES",
#                                      Binop("PLUS",
#                                            Mem(Binop("PLUS",
#                                                      Reg("fp"),
#                                                      IntValue(-16))),
#                                            IntValue(1)),
#                                      IntValue(4)))),
#                      Binop("TIMES",
#                            Binop("PLUS", IntValue(3), IntValue(1)),
#                            IntValue(4)))))
#
        lw         $t0, -40($fp)
        lw         $t1, -16($fp)
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
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-40)))))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_40
        lw         $t2, -16($fp)
        lw         $t3, -40($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_40:
ASSERT_40:
        li         $v0,40
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(4), IntValue(0)),
#              Binop("LT",
#                    IntValue(4),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-40))),
#                                  Binop("TIMES",
#                                        Binop("PLUS",
#                                              Mem(Binop("PLUS",
#                                                        Reg("fp"),
#                                                        IntValue(-16))),
#                                              IntValue(1)),
#                                        IntValue(4))))))))
#
        li         $t0, 4
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_41
        li         $t2, 4
        lw         $t3, -40($fp)
        lw         $t4, -16($fp)
        li         $t5, 1
        addu       $t4,$t5
        li         $t6, 4
        mult       $t4,$t6
        addu       $t3,$t4
        lw         $t3
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_41:
ASSERT_41:
        li         $v0,41
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-40)))))))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_42
        lw         $t2, -16($fp)
        lw         $t3, -40($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_42:
ASSERT_42:
        li         $v0,42
        beq        $t0, 0, AssertionFailure
#
# SystemCall("WRITE_INT",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-40))),
#                                Binop("TIMES",
#                                      Binop("PLUS",
#                                            Mem(Binop("PLUS",
#                                                      Reg("fp"),
#                                                      IntValue(-16))),
#                                            IntValue(1)),
#                                      IntValue(4)))),
#                      Binop("TIMES",
#                            Binop("PLUS", IntValue(4), IntValue(1)),
#                            IntValue(4)))))
#
        lw         $t0, -40($fp)
        lw         $t1, -16($fp)
        li         $t2, 1
        addu       $t1,$t2
        li         $t3, 4
        mult       $t1,$t3
        addu       $t0,$t1
        lw         $t0
        li         $t4, 4
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
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-16))), IntValue(1)))
#
        lw         $t0, -16($fp)
        li         $t1, 1
        addu       $t0,$t1
        sw         $t0, -16($fp)
#
# Jump("loop_11")
#
        jr         loop_11
#
# Label("exit_12")
#
exit_12:
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
