#
# Label("up_5")
#
up_5:
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
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                          IntValue(-8))),
#                IntValue(-12))),
#      Binop("PLUS",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                IntValue(-8))),
#                      IntValue(-12))),
#            IntValue(1)))
#
        lw         $t0, -8($fp)
        li         $t1, -8
        addu       $t0,$t1
        lw         $t0
        li         $t2, -12
        addu       $t0,$t2
        lw         $t3, -8($fp)
        li         $t4, -8
        addu       $t3,$t4
        lw         $t3
        li         $t5, -12
        addu       $t3,$t5
        lw         $t3
        li         $t6, 1
        addu       $t3,$t6
        sw         $t3, ($t0)
#
# CJump(Binop("LT",
#             Mem(Binop("PLUS",
#                       Mem(Binop("PLUS",
#                                 Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                 IntValue(-8))),
#                       IntValue(-12))),
#             Mem(Binop("PLUS",
#                       Mem(Binop("PLUS",
#                                 Mem(Binop("PLUS",
#                                           Mem(Binop("PLUS",
#                                                     Mem(Binop("PLUS",
#                                                               Reg("fp"),
#                                                               IntValue(-8))),
#                                                     IntValue(-8))),
#                                           IntValue(-8))),
#                                 IntValue(-8))),
#                       IntValue(-12)))),
#       "exit_7")
#
        lw         $t0, -8($fp)
        li         $t1, -8
        addu       $t0,$t1
        lw         $t0
        li         $t2, -12
        addu       $t0,$t2
        lw         $t0
        lw         $t3, -8($fp)
        li         $t4, -8
        addu       $t3,$t4
        lw         $t3
        li         $t5, -8
        addu       $t3,$t5
        lw         $t3
        li         $t6, -8
        addu       $t3,$t6
        lw         $t3
        li         $t7, -12
        addu       $t3,$t7
        lw         $t3
        blt        $t0,$t3
        beq        $t0, 1, exit_7
#
# Jump("cont_6")
#
        jr         cont_6
#
# Label("exit_7")
#
exit_7:
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS",
#                              Mem(Binop("PLUS",
#                                        Mem(Binop("PLUS",
#                                                  Reg("fp"),
#                                                  IntValue(-8))),
#                                        IntValue(-8))),
#                              IntValue(-12))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS",
#                              Mem(Binop("PLUS",
#                                        Mem(Binop("PLUS",
#                                                  Reg("fp"),
#                                                  IntValue(-8))),
#                                        IntValue(-8))),
#                              IntValue(-12))),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS",
#                                            Mem(Binop("PLUS",
#                                                      Mem(Binop("PLUS",
#                                                                Reg("fp"),
#                                                                IntValue(-8))),
#                                                      IntValue(-8))),
#                                            IntValue(-8))),
#                                  IntValue(12)))))))
#
        lw         $t0, -8($fp)
        li         $t1, -8
        addu       $t0,$t1
        lw         $t0
        li         $t2, -12
        addu       $t0,$t2
        lw         $t0
        li         $t3, 0
        bge        $t0,$t3
        beq        $t0, 0, L_1
        lw         $t4, -8($fp)
        li         $t5, -8
        addu       $t4,$t5
        lw         $t4
        li         $t6, -12
        addu       $t4,$t6
        lw         $t4
        lw         $t7, -8($fp)
        li         $t8, -8
        addu       $t7,$t8
        lw         $t7
        li         $t9, -8
        addu       $t7,$t9
        lw         $t7
        li         $s0, 12
        addu       $t7,$s0
        lw         $t7
        lw         $t7
        blt        $t4,$t7
        move       $t0, $t4
L_1:
ASSERT_1:
        li         $v0,1
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS",
#                              Mem(Binop("PLUS",
#                                        Mem(Binop("PLUS",
#                                                  Reg("fp"),
#                                                  IntValue(-8))),
#                                        IntValue(-8))),
#                              IntValue(8))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS",
#                              Mem(Binop("PLUS",
#                                        Mem(Binop("PLUS",
#                                                  Reg("fp"),
#                                                  IntValue(-8))),
#                                        IntValue(-8))),
#                              IntValue(8))),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS",
#                                            Mem(Binop("PLUS",
#                                                      Mem(Binop("PLUS",
#                                                                Reg("fp"),
#                                                                IntValue(-8))),
#                                                      IntValue(-8))),
#                                            IntValue(-8))),
#                                  IntValue(12)))))))
#
        lw         $t0, -8($fp)
        li         $t1, -8
        addu       $t0,$t1
        lw         $t0
        li         $t2, 8
        addu       $t0,$t2
        lw         $t0
        li         $t3, 0
        bge        $t0,$t3
        beq        $t0, 0, L_2
        lw         $t4, -8($fp)
        li         $t5, -8
        addu       $t4,$t5
        lw         $t4
        li         $t6, 8
        addu       $t4,$t6
        lw         $t4
        lw         $t7, -8($fp)
        li         $t8, -8
        addu       $t7,$t8
        lw         $t7
        li         $t9, -8
        addu       $t7,$t9
        lw         $t7
        li         $s0, 12
        addu       $t7,$s0
        lw         $t7
        lw         $t7
        blt        $t4,$t7
        move       $t0, $t4
L_2:
ASSERT_2:
        li         $v0,2
        beq        $t0, 0, AssertionFailure
#
# CJump(Binop("LT",
#             Mem(Binop("PLUS",
#                       Mem(Binop("PLUS",
#                                 Mem(Binop("PLUS",
#                                           Mem(Binop("PLUS",
#                                                     Mem(Binop("PLUS",
#                                                               Reg("fp"),
#                                                               IntValue(-8))),
#                                                     IntValue(-8))),
#                                           IntValue(-8))),
#                                 IntValue(12))),
#                       Binop("TIMES",
#                             Binop("PLUS",
#                                   Mem(Binop("PLUS",
#                                             Mem(Binop("PLUS",
#                                                       Mem(Binop("PLUS",
#                                                                 Reg("fp"),
#                                                                 IntValue(-8))),
#                                                       IntValue(-8))),
#                                             IntValue(-12))),
#                                   IntValue(1)),
#                             IntValue(4)))),
#             Mem(Binop("PLUS",
#                       Mem(Binop("PLUS",
#                                 Mem(Binop("PLUS",
#                                           Mem(Binop("PLUS",
#                                                     Mem(Binop("PLUS",
#                                                               Reg("fp"),
#                                                               IntValue(-8))),
#                                                     IntValue(-8))),
#                                           IntValue(-8))),
#                                 IntValue(12))),
#                       Binop("TIMES",
#                             Binop("PLUS",
#                                   Mem(Binop("PLUS",
#                                             Mem(Binop("PLUS",
#                                                       Mem(Binop("PLUS",
#                                                                 Reg("fp"),
#                                                                 IntValue(-8))),
#                                                       IntValue(-8))),
#                                             IntValue(8))),
#                                   IntValue(1)),
#                             IntValue(4))))),
#       "exit_9")
#
        lw         $t0, -8($fp)
        li         $t1, -8
        addu       $t0,$t1
        lw         $t0
        li         $t2, -8
        addu       $t0,$t2
        lw         $t0
        li         $t3, 12
        addu       $t0,$t3
        lw         $t0
        lw         $t4, -8($fp)
        li         $t5, -8
        addu       $t4,$t5
        lw         $t4
        li         $t6, -12
        addu       $t4,$t6
        lw         $t4
        li         $t7, 1
        addu       $t4,$t7
        li         $t8, 4
        mult       $t4,$t8
        addu       $t0,$t4
        lw         $t0
        lw         $t9, -8($fp)
        li         $s0, -8
        addu       $t9,$s0
        lw         $t9
        li         $s1, -8
        addu       $t9,$s1
        lw         $t9
        li         $s2, 12
        addu       $t9,$s2
        lw         $t9
        lw         $s3, -8($fp)
        li         $s4, -8
        addu       $s3,$s4
        lw         $s3
        li         $s5, 8
        addu       $s3,$s5
        lw         $s3
        li         $s6, 1
        addu       $s3,$s6
        li         $s7, 4
        mult       $s3,$s7
        addu       $t9,$s3
        lw         $t9
        blt        $t0,$t9
        beq        $t0, 1, exit_9
#
# Jump("cont_8")
#
        jr         cont_8
#
# Label("exit_9")
#
exit_9:
#
# CallP("up_5", Mem(Binop("PLUS", Reg("fp"), IntValue(-8))), List())
#
        lw         $t0, -8($fp)
        move       $v0, $t0
        jal        up_5
        move       $t0, $a0
#
# Label("cont_8")
#
cont_8:
#
# Label("cont_6")
#
cont_6:
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
# Label("down_10")
#
down_10:
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
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                          IntValue(-8))),
#                IntValue(-16))),
#      Binop("MINUS",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                IntValue(-8))),
#                      IntValue(-16))),
#            IntValue(1)))
#
        lw         $t0, -8($fp)
        li         $t1, -8
        addu       $t0,$t1
        lw         $t0
        li         $t2, -16
        addu       $t0,$t2
        lw         $t3, -8($fp)
        li         $t4, -8
        addu       $t3,$t4
        lw         $t3
        li         $t5, -16
        addu       $t3,$t5
        lw         $t3
        li         $t6, 1
        subu       $t3,$t6
        sw         $t3, ($t0)
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS",
#                              Mem(Binop("PLUS",
#                                        Mem(Binop("PLUS",
#                                                  Reg("fp"),
#                                                  IntValue(-8))),
#                                        IntValue(-8))),
#                              IntValue(-16))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS",
#                              Mem(Binop("PLUS",
#                                        Mem(Binop("PLUS",
#                                                  Reg("fp"),
#                                                  IntValue(-8))),
#                                        IntValue(-8))),
#                              IntValue(-16))),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS",
#                                            Mem(Binop("PLUS",
#                                                      Mem(Binop("PLUS",
#                                                                Reg("fp"),
#                                                                IntValue(-8))),
#                                                      IntValue(-8))),
#                                            IntValue(-8))),
#                                  IntValue(12)))))))
#
        lw         $t0, -8($fp)
        li         $t1, -8
        addu       $t0,$t1
        lw         $t0
        li         $t2, -16
        addu       $t0,$t2
        lw         $t0
        li         $t3, 0
        bge        $t0,$t3
        beq        $t0, 0, L_3
        lw         $t4, -8($fp)
        li         $t5, -8
        addu       $t4,$t5
        lw         $t4
        li         $t6, -16
        addu       $t4,$t6
        lw         $t4
        lw         $t7, -8($fp)
        li         $t8, -8
        addu       $t7,$t8
        lw         $t7
        li         $t9, -8
        addu       $t7,$t9
        lw         $t7
        li         $s0, 12
        addu       $t7,$s0
        lw         $t7
        lw         $t7
        blt        $t4,$t7
        move       $t0, $t4
L_3:
ASSERT_3:
        li         $v0,3
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS",
#                              Mem(Binop("PLUS",
#                                        Mem(Binop("PLUS",
#                                                  Reg("fp"),
#                                                  IntValue(-8))),
#                                        IntValue(-8))),
#                              IntValue(8))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS",
#                              Mem(Binop("PLUS",
#                                        Mem(Binop("PLUS",
#                                                  Reg("fp"),
#                                                  IntValue(-8))),
#                                        IntValue(-8))),
#                              IntValue(8))),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS",
#                                            Mem(Binop("PLUS",
#                                                      Mem(Binop("PLUS",
#                                                                Reg("fp"),
#                                                                IntValue(-8))),
#                                                      IntValue(-8))),
#                                            IntValue(-8))),
#                                  IntValue(12)))))))
#
        lw         $t0, -8($fp)
        li         $t1, -8
        addu       $t0,$t1
        lw         $t0
        li         $t2, 8
        addu       $t0,$t2
        lw         $t0
        li         $t3, 0
        bge        $t0,$t3
        beq        $t0, 0, L_4
        lw         $t4, -8($fp)
        li         $t5, -8
        addu       $t4,$t5
        lw         $t4
        li         $t6, 8
        addu       $t4,$t6
        lw         $t4
        lw         $t7, -8($fp)
        li         $t8, -8
        addu       $t7,$t8
        lw         $t7
        li         $t9, -8
        addu       $t7,$t9
        lw         $t7
        li         $s0, 12
        addu       $t7,$s0
        lw         $t7
        lw         $t7
        blt        $t4,$t7
        move       $t0, $t4
L_4:
ASSERT_4:
        li         $v0,4
        beq        $t0, 0, AssertionFailure
#
# CJump(Binop("GT",
#             Mem(Binop("PLUS",
#                       Mem(Binop("PLUS",
#                                 Mem(Binop("PLUS",
#                                           Mem(Binop("PLUS",
#                                                     Mem(Binop("PLUS",
#                                                               Reg("fp"),
#                                                               IntValue(-8))),
#                                                     IntValue(-8))),
#                                           IntValue(-8))),
#                                 IntValue(12))),
#                       Binop("TIMES",
#                             Binop("PLUS",
#                                   Mem(Binop("PLUS",
#                                             Mem(Binop("PLUS",
#                                                       Mem(Binop("PLUS",
#                                                                 Reg("fp"),
#                                                                 IntValue(-8))),
#                                                       IntValue(-8))),
#                                             IntValue(-16))),
#                                   IntValue(1)),
#                             IntValue(4)))),
#             Mem(Binop("PLUS",
#                       Mem(Binop("PLUS",
#                                 Mem(Binop("PLUS",
#                                           Mem(Binop("PLUS",
#                                                     Mem(Binop("PLUS",
#                                                               Reg("fp"),
#                                                               IntValue(-8))),
#                                                     IntValue(-8))),
#                                           IntValue(-8))),
#                                 IntValue(12))),
#                       Binop("TIMES",
#                             Binop("PLUS",
#                                   Mem(Binop("PLUS",
#                                             Mem(Binop("PLUS",
#                                                       Mem(Binop("PLUS",
#                                                                 Reg("fp"),
#                                                                 IntValue(-8))),
#                                                       IntValue(-8))),
#                                             IntValue(8))),
#                                   IntValue(1)),
#                             IntValue(4))))),
#       "exit_12")
#
        lw         $t0, -8($fp)
        li         $t1, -8
        addu       $t0,$t1
        lw         $t0
        li         $t2, -8
        addu       $t0,$t2
        lw         $t0
        li         $t3, 12
        addu       $t0,$t3
        lw         $t0
        lw         $t4, -8($fp)
        li         $t5, -8
        addu       $t4,$t5
        lw         $t4
        li         $t6, -16
        addu       $t4,$t6
        lw         $t4
        li         $t7, 1
        addu       $t4,$t7
        li         $t8, 4
        mult       $t4,$t8
        addu       $t0,$t4
        lw         $t0
        lw         $t9, -8($fp)
        li         $s0, -8
        addu       $t9,$s0
        lw         $t9
        li         $s1, -8
        addu       $t9,$s1
        lw         $t9
        li         $s2, 12
        addu       $t9,$s2
        lw         $t9
        lw         $s3, -8($fp)
        li         $s4, -8
        addu       $s3,$s4
        lw         $s3
        li         $s5, 8
        addu       $s3,$s5
        lw         $s3
        li         $s6, 1
        addu       $s3,$s6
        li         $s7, 4
        mult       $s3,$s7
        addu       $t9,$s3
        lw         $t9
        bgt        $t0,$t9
        beq        $t0, 1, exit_12
#
# Jump("cont_11")
#
        jr         cont_11
#
# Label("exit_12")
#
exit_12:
#
# CallP("down_10", Mem(Binop("PLUS", Reg("fp"), IntValue(-8))), List())
#
        lw         $t0, -8($fp)
        move       $v0, $t0
        jal        down_10
        move       $t0, $a0
#
# Label("cont_11")
#
cont_11:
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
# Label("meet_4")
#
meet_4:
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
# CJump(Binop("LT",
#             Mem(Binop("PLUS",
#                       Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                       IntValue(-12))),
#             Mem(Binop("PLUS",
#                       Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                       IntValue(-16)))),
#       "exit_14")
#
        lw         $t0, -8($fp)
        li         $t1, -12
        addu       $t0,$t1
        lw         $t0
        lw         $t2, -8($fp)
        li         $t3, -16
        addu       $t2,$t3
        lw         $t2
        blt        $t0,$t2
        beq        $t0, 1, exit_14
#
# Jump("cont_13")
#
        jr         cont_13
#
# Label("exit_14")
#
exit_14:
#
# CallP("up_5", Reg("fp"), List())
#
        move       $v0, $fp
        jal        up_5
        move       $t0, $a0
#
# CallP("down_10", Reg("fp"), List())
#
        move       $v0, $fp
        jal        down_10
        move       $t0, $a0
#
# CJump(Binop("LT",
#             Mem(Binop("PLUS",
#                       Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                       IntValue(-12))),
#             Mem(Binop("PLUS",
#                       Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                       IntValue(-16)))),
#       "exit_16")
#
        lw         $t0, -8($fp)
        li         $t1, -12
        addu       $t0,$t1
        lw         $t0
        lw         $t2, -8($fp)
        li         $t3, -16
        addu       $t2,$t3
        lw         $t2
        blt        $t0,$t2
        beq        $t0, 1, exit_16
#
# Jump("cont_15")
#
        jr         cont_15
#
# Label("exit_16")
#
exit_16:
#
# CallP("exchange_3",
#       Mem(Binop("PLUS",
#                 Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                 IntValue(-8))),
#       List(Mem(Binop("PLUS",
#                      Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                      IntValue(-12))),
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                      IntValue(-16)))))
#
        subu       $sp, $sp, 8
        lw         $t0, -8($fp)
        li         $t1, -12
        addu       $t0,$t1
        lw         $t0
        sw         $t0, 8($sp)
        lw         $t0, -8($fp)
        li         $t2, -16
        addu       $t0,$t2
        lw         $t0
        sw         $t0, 4($sp)
        lw         $t0, -8($fp)
        li         $t3, -8
        addu       $t0,$t3
        lw         $t0
        move       $v0, $t0
        jal        exchange_3
        addu       $sp, $sp, 8
        move       $t0, $a0
#
# Label("cont_15")
#
cont_15:
#
# CallP("meet_4", Mem(Binop("PLUS", Reg("fp"), IntValue(-8))), List())
#
        lw         $t0, -8($fp)
        move       $v0, $t0
        jal        meet_4
        move       $t0, $a0
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
# Label("partition_2")
#
partition_2:
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
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#      Mem(Binop("PLUS", Reg("fp"), IntValue(8))))
#
        lw         $t0, 8($fp)
        sw         $t0, -12($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(4))), IntValue(1)))
#
        lw         $t0, 4($fp)
        li         $t1, 1
        addu       $t0,$t1
        sw         $t0, -16($fp)
#
# CallP("meet_4", Reg("fp"), List())
#
        move       $v0, $fp
        jal        meet_4
        move       $t0, $a0
#
# CallP("exchange_3",
#       Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#       List(Mem(Binop("PLUS", Reg("fp"), IntValue(8))),
#            Mem(Binop("PLUS", Reg("fp"), IntValue(-16)))))
#
        subu       $sp, $sp, 8
        lw         $t0, 8($fp)
        sw         $t0, 8($sp)
        lw         $t0, -16($fp)
        sw         $t0, 4($sp)
        lw         $t0, -8($fp)
        move       $v0, $t0
        jal        exchange_3
        addu       $sp, $sp, 8
        move       $t0, $a0
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
# Label("exchange_3")
#
exchange_3:
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
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(8))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(8))),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(12)))))))
#
        lw         $t0, 8($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_5
        lw         $t2, 8($fp)
        lw         $t3, -8($fp)
        li         $t4, 12
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
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#      Mem(Binop("PLUS",
#                Mem(Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                          IntValue(12))),
#                Binop("TIMES",
#                      Binop("PLUS",
#                            Mem(Binop("PLUS", Reg("fp"), IntValue(8))),
#                            IntValue(1)),
#                      IntValue(4)))))
#
        lw         $t0, -8($fp)
        li         $t1, 12
        addu       $t0,$t1
        lw         $t0
        lw         $t2, 8($fp)
        li         $t3, 1
        addu       $t2,$t3
        li         $t4, 4
        mult       $t2,$t4
        addu       $t0,$t2
        lw         $t0
        sw         $t0, -12($fp)
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(8))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(8))),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(12)))))))
#
        lw         $t0, 8($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_6
        lw         $t2, 8($fp)
        lw         $t3, -8($fp)
        li         $t4, 12
        addu       $t3,$t4
        lw         $t3
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
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(12)))))))
#
        lw         $t0, 4($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_7
        lw         $t2, 4($fp)
        lw         $t3, -8($fp)
        li         $t4, 12
        addu       $t3,$t4
        lw         $t3
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_7:
ASSERT_7:
        li         $v0,7
        beq        $t0, 0, AssertionFailure
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                          IntValue(12))),
#                Binop("TIMES",
#                      Binop("PLUS",
#                            Mem(Binop("PLUS", Reg("fp"), IntValue(8))),
#                            IntValue(1)),
#                      IntValue(4)))),
#      Mem(Binop("PLUS",
#                Mem(Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                          IntValue(12))),
#                Binop("TIMES",
#                      Binop("PLUS",
#                            Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                            IntValue(1)),
#                      IntValue(4)))))
#
        lw         $t0, -8($fp)
        li         $t1, 12
        addu       $t0,$t1
        lw         $t0
        lw         $t2, 8($fp)
        li         $t3, 1
        addu       $t2,$t3
        li         $t4, 4
        mult       $t2,$t4
        addu       $t0,$t2
        lw         $t5, -8($fp)
        li         $t6, 12
        addu       $t5,$t6
        lw         $t5
        lw         $t7, 4($fp)
        li         $t8, 1
        addu       $t7,$t8
        li         $t9, 4
        mult       $t7,$t9
        addu       $t5,$t7
        lw         $t5
        sw         $t5, ($t0)
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(12)))))))
#
        lw         $t0, 4($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_8
        lw         $t2, 4($fp)
        lw         $t3, -8($fp)
        li         $t4, 12
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
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                          IntValue(12))),
#                Binop("TIMES",
#                      Binop("PLUS",
#                            Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                            IntValue(1)),
#                      IntValue(4)))),
#      Mem(Binop("PLUS", Reg("fp"), IntValue(-12))))
#
        lw         $t0, -8($fp)
        li         $t1, 12
        addu       $t0,$t1
        lw         $t0
        lw         $t2, 4($fp)
        li         $t3, 1
        addu       $t2,$t3
        li         $t4, 4
        mult       $t2,$t4
        addu       $t0,$t2
        lw         $t5, -12($fp)
        sw         $t5, ($t0)
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
# Label("quicksort_1")
#
quicksort_1:
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
# CJump(Binop("GT",
#             Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#             Mem(Binop("PLUS", Reg("fp"), IntValue(8)))),
#       "exit_18")
#
        lw         $t0, 4($fp)
        lw         $t1, 8($fp)
        bgt        $t0,$t1
        beq        $t0, 1, exit_18
#
# Jump("cont_17")
#
        jr         cont_17
#
# Label("exit_18")
#
exit_18:
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#      Call("partition_2",
#           Reg("fp"),
#           List(Mem(Binop("PLUS", Reg("fp"), IntValue(8))),
#                Mem(Binop("PLUS", Reg("fp"), IntValue(4))))))
#
        subu       $sp, $sp, 8
        lw         $t0, 8($fp)
        sw         $t0, 8($sp)
        lw         $t0, 4($fp)
        sw         $t0, 4($sp)
        move       $v0, $fp
        jal        partition_2
        addu       $sp, $sp, 8
        move       $t0, $a0
        sw         $t0, -12($fp)
#
# CallP("quicksort_1",
#       Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#       List(Mem(Binop("PLUS", Reg("fp"), IntValue(12))),
#            Mem(Binop("PLUS", Reg("fp"), IntValue(8))),
#            Binop("MINUS",
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                  IntValue(1))))
#
        subu       $sp, $sp, 12
        lw         $t0, 12($fp)
        sw         $t0, 12($sp)
        lw         $t0, 8($fp)
        sw         $t0, 8($sp)
        lw         $t0, -12($fp)
        li         $t1, 1
        subu       $t0,$t1
        sw         $t0, 4($sp)
        lw         $t0, -8($fp)
        move       $v0, $t0
        jal        quicksort_1
        addu       $sp, $sp, 12
        move       $t0, $a0
#
# CallP("quicksort_1",
#       Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#       List(Mem(Binop("PLUS", Reg("fp"), IntValue(12))),
#            Binop("PLUS",
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                  IntValue(1)),
#            Mem(Binop("PLUS", Reg("fp"), IntValue(4)))))
#
        subu       $sp, $sp, 12
        lw         $t0, 12($fp)
        sw         $t0, 12($sp)
        lw         $t0, -12($fp)
        li         $t1, 1
        addu       $t0,$t1
        sw         $t0, 8($sp)
        lw         $t0, 4($fp)
        sw         $t0, 4($sp)
        lw         $t0, -8($fp)
        move       $v0, $t0
        jal        quicksort_1
        addu       $sp, $sp, 12
        move       $t0, $a0
#
# Label("cont_17")
#
cont_17:
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
# Label("readarray_19")
#
readarray_19:
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
# Label("loop_20")
#
loop_20:
#
# CJump(Unop("NOT",
#            Binop("LT",
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                  Binop("MINUS",
#                        Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(-12))),
#                        IntValue(1)))),
#       "exit_21")
#
        lw         $t0, -12($fp)
        lw         $t1, -8($fp)
        li         $t2, -12
        addu       $t1,$t2
        lw         $t1
        li         $t3, 1
        subu       $t1,$t3
        blt        $t0,$t1
        seq        $t0,$t0, 0
        beq        $t0, 1, exit_21
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(-16)))))))
#
        lw         $t0, -12($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_9
        lw         $t2, -12($fp)
        lw         $t3, -8($fp)
        li         $t4, -16
        addu       $t3,$t4
        lw         $t3
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_9:
ASSERT_9:
        li         $v0,9
        beq        $t0, 0, AssertionFailure
#
# SystemCall("READ_INT",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                IntValue(-16))),
#                      Binop("TIMES",
#                            Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                                  IntValue(1)),
#                            IntValue(4)))))
#
        lw         $t0, -8($fp)
        li         $t1, -16
        addu       $t0,$t1
        lw         $t0
        lw         $t2, -12($fp)
        li         $t3, 1
        addu       $t2,$t3
        li         $t4, 4
        mult       $t2,$t4
        addu       $t0,$t2
        lw         $t0
        move       $a0,$t0
        li         $v0,()
        syscall
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-12))), IntValue(1)))
#
        lw         $t0, -12($fp)
        li         $t1, 1
        addu       $t0,$t1
        sw         $t0, -12($fp)
#
# Jump("loop_20")
#
        jr         loop_20
#
# Label("exit_21")
#
exit_21:
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(-16)))))))
#
        lw         $t0, -12($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_10
        lw         $t2, -12($fp)
        lw         $t3, -8($fp)
        li         $t4, -16
        addu       $t3,$t4
        lw         $t3
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_10:
ASSERT_10:
        li         $v0,10
        beq        $t0, 0, AssertionFailure
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                          IntValue(-16))),
#                Binop("TIMES",
#                      Binop("PLUS",
#                            Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                            IntValue(1)),
#                      IntValue(4)))),
#      Unop("MINUS", IntValue(1000)))
#
        lw         $t0, -8($fp)
        li         $t1, -16
        addu       $t0,$t1
        lw         $t0
        lw         $t2, -12($fp)
        li         $t3, 1
        addu       $t2,$t3
        li         $t4, 4
        mult       $t2,$t4
        addu       $t0,$t2
        li         $t5, 1000
        neg        $t5,$t5
        sw         $t5, ($t0)
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
# Label("writearray_22")
#
writearray_22:
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
# Label("loop_23")
#
loop_23:
#
# CJump(Unop("NOT",
#            Binop("LT",
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                  Binop("MINUS",
#                        Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(-12))),
#                        IntValue(1)))),
#       "exit_24")
#
        lw         $t0, -12($fp)
        lw         $t1, -8($fp)
        li         $t2, -12
        addu       $t1,$t2
        lw         $t1
        li         $t3, 1
        subu       $t1,$t3
        blt        $t0,$t1
        seq        $t0,$t0, 0
        beq        $t0, 1, exit_24
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(-16)))))))
#
        lw         $t0, -12($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_11
        lw         $t2, -12($fp)
        lw         $t3, -8($fp)
        li         $t4, -16
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
# SystemCall("WRITE_INT",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                IntValue(-16))),
#                      Binop("TIMES",
#                            Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                                  IntValue(1)),
#                            IntValue(4)))))
#
        lw         $t0, -8($fp)
        li         $t1, -16
        addu       $t0,$t1
        lw         $t0
        lw         $t2, -12($fp)
        li         $t3, 1
        addu       $t2,$t3
        li         $t4, 4
        mult       $t2,$t4
        addu       $t0,$t2
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
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-12))), IntValue(1)))
#
        lw         $t0, -12($fp)
        li         $t1, 1
        addu       $t0,$t1
        sw         $t0, -12($fp)
#
# Jump("loop_23")
#
        jr         loop_23
#
# Label("exit_24")
#
exit_24:
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
# Move(Reg("sp"), Binop("PLUS", Reg("sp"), IntValue(-32)))
#
        li         $t0, -32
        addu       $sp,$t0
        move       $sp,$sp
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-12))), IntValue(10))
#
        li         $t0, 10
        sw         $t0, -12($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-20))),
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
        sw         $t4, -20($fp)
#
# Move(Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-20)))),
#      Binop("PLUS", IntValue(0), Mem(Binop("PLUS", Reg("fp"), IntValue(-12)))))
#
        lw         $t0, -20($fp)
        li         $t1, 0
        lw         $t2, -12($fp)
        addu       $t1,$t2
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
# Label("loop_28")
#
loop_28:
#
# CJump(Binop("GEQ",
#             Mem(Binop("PLUS", Reg("fp"), IntValue(-28))),
#             Mem(Binop("PLUS", Reg("fp"), IntValue(-12)))),
#       "exit_29")
#
        lw         $t0, -28($fp)
        lw         $t1, -12($fp)
        bge        $t0,$t1
        beq        $t0, 1, exit_29
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-20))),
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-24))))),
#      IntValue(0))
#
        lw         $t0, -20($fp)
        lw         $t1, -24($fp)
        addu       $t0,$t1
        li         $t2, 0
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
# Jump("loop_28")
#
        jr         loop_28
#
# Label("exit_29")
#
exit_29:
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#      Mem(Binop("PLUS", Reg("fp"), IntValue(-20))))
#
        lw         $t0, -20($fp)
        sw         $t0, -16($fp)
#
# SystemCall("WRITE_STRING", StringValue("Give 9 integers:"))
#
        li         $t0, Give 9 integers:
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
# CallP("readarray_19", Reg("fp"), List())
#
        move       $v0, $fp
        jal        readarray_19
        move       $t0, $a0
#
# SystemCall("WRITE_STRING", StringValue("The sorted numbers are:"))
#
        li         $t0, The sorted numbers are:
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
# CallP("quicksort_1",
#       Reg("fp"),
#       List(Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#            IntValue(0),
#            Binop("MINUS",
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                  IntValue(2))))
#
        subu       $sp, $sp, 12
        lw         $t0, -16($fp)
        sw         $t0, 12($sp)
        li         $t0, 0
        sw         $t0, 8($sp)
        lw         $t0, -12($fp)
        li         $t1, 2
        subu       $t0,$t1
        sw         $t0, 4($sp)
        move       $v0, $fp
        jal        quicksort_1
        addu       $sp, $sp, 12
        move       $t0, $a0
#
# CallP("writearray_22", Reg("fp"), List())
#
        move       $v0, $fp
        jal        writearray_22
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
