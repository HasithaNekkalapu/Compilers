#
# Label("print_1")
#
print_1:
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
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(0), IntValue(0)),
#              Binop("LT",
#                    IntValue(0),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(-28)))))))
#
        li         $t0, 0
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_1
        li         $t2, 0
        lw         $t3, -8($fp)
        li         $t4, -28
        addu       $t3,$t4
        lw         $t3
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
#                      Mem(Binop("PLUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                IntValue(-28))),
#                      Binop("TIMES",
#                            Binop("PLUS", IntValue(0), IntValue(1)),
#                            IntValue(4)))))
#
        lw         $t0, -8($fp)
        li         $t1, -28
        addu       $t0,$t1
        lw         $t0
        li         $t2, 0
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
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(1), IntValue(0)),
#              Binop("LT",
#                    IntValue(1),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(-28)))))))
#
        li         $t0, 1
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_2
        li         $t2, 1
        lw         $t3, -8($fp)
        li         $t4, -28
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
# SystemCall("WRITE_INT",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                IntValue(-28))),
#                      Binop("TIMES",
#                            Binop("PLUS", IntValue(1), IntValue(1)),
#                            IntValue(4)))))
#
        lw         $t0, -8($fp)
        li         $t1, -28
        addu       $t0,$t1
        lw         $t0
        li         $t2, 1
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
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(2), IntValue(0)),
#              Binop("LT",
#                    IntValue(2),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(-28)))))))
#
        li         $t0, 2
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_3
        li         $t2, 2
        lw         $t3, -8($fp)
        li         $t4, -28
        addu       $t3,$t4
        lw         $t3
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_3:
ASSERT_3:
        li         $v0,3
        beq        $t0, 0, AssertionFailure
#
# SystemCall("WRITE_INT",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                IntValue(-28))),
#                      Binop("TIMES",
#                            Binop("PLUS", IntValue(2), IntValue(1)),
#                            IntValue(4)))))
#
        lw         $t0, -8($fp)
        li         $t1, -28
        addu       $t0,$t1
        lw         $t0
        li         $t2, 2
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
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(3), IntValue(0)),
#              Binop("LT",
#                    IntValue(3),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(-28)))))))
#
        li         $t0, 3
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_4
        li         $t2, 3
        lw         $t3, -8($fp)
        li         $t4, -28
        addu       $t3,$t4
        lw         $t3
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_4:
ASSERT_4:
        li         $v0,4
        beq        $t0, 0, AssertionFailure
#
# SystemCall("WRITE_INT",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                IntValue(-28))),
#                      Binop("TIMES",
#                            Binop("PLUS", IntValue(3), IntValue(1)),
#                            IntValue(4)))))
#
        lw         $t0, -8($fp)
        li         $t1, -28
        addu       $t0,$t1
        lw         $t0
        li         $t2, 3
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
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(4), IntValue(0)),
#              Binop("LT",
#                    IntValue(4),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(-28)))))))
#
        li         $t0, 4
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_5
        li         $t2, 4
        lw         $t3, -8($fp)
        li         $t4, -28
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
# SystemCall("WRITE_INT",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                IntValue(-28))),
#                      Binop("TIMES",
#                            Binop("PLUS", IntValue(4), IntValue(1)),
#                            IntValue(4)))))
#
        lw         $t0, -8($fp)
        li         $t1, -28
        addu       $t0,$t1
        lw         $t0
        li         $t2, 4
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
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(5), IntValue(0)),
#              Binop("LT",
#                    IntValue(5),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(-28)))))))
#
        li         $t0, 5
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_6
        li         $t2, 5
        lw         $t3, -8($fp)
        li         $t4, -28
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
# SystemCall("WRITE_INT",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                IntValue(-28))),
#                      Binop("TIMES",
#                            Binop("PLUS", IntValue(5), IntValue(1)),
#                            IntValue(4)))))
#
        lw         $t0, -8($fp)
        li         $t1, -28
        addu       $t0,$t1
        lw         $t0
        li         $t2, 5
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
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(6), IntValue(0)),
#              Binop("LT",
#                    IntValue(6),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(-28)))))))
#
        li         $t0, 6
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_7
        li         $t2, 6
        lw         $t3, -8($fp)
        li         $t4, -28
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
# SystemCall("WRITE_INT",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                IntValue(-28))),
#                      Binop("TIMES",
#                            Binop("PLUS", IntValue(6), IntValue(1)),
#                            IntValue(4)))))
#
        lw         $t0, -8($fp)
        li         $t1, -28
        addu       $t0,$t1
        lw         $t0
        li         $t2, 6
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
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(7), IntValue(0)),
#              Binop("LT",
#                    IntValue(7),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(-28)))))))
#
        li         $t0, 7
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_8
        li         $t2, 7
        lw         $t3, -8($fp)
        li         $t4, -28
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
# SystemCall("WRITE_INT",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                IntValue(-28))),
#                      Binop("TIMES",
#                            Binop("PLUS", IntValue(7), IntValue(1)),
#                            IntValue(4)))))
#
        lw         $t0, -8($fp)
        li         $t1, -28
        addu       $t0,$t1
        lw         $t0
        li         $t2, 7
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
# Label("queens_2")
#
queens_2:
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
# Label("loop_3")
#
loop_3:
#
# CJump(Unop("NOT",
#            Binop("LT",
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                  IntValue(8))),
#       "exit_4")
#
        lw         $t0, -12($fp)
        li         $t1, 8
        blt        $t0,$t1
        seq        $t0,$t0, 0
        beq        $t0, 1, exit_4
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(-24)))))))
#
        lw         $t0, -12($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_9
        lw         $t2, -12($fp)
        lw         $t3, -8($fp)
        li         $t4, -24
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
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Binop("PLUS",
#                          Binop("MINUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(4)))),
#                          IntValue(7)),
#                    IntValue(0)),
#              Binop("LT",
#                    Binop("PLUS",
#                          Binop("MINUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(4)))),
#                          IntValue(7)),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(-16)))))))
#
        lw         $t0, -12($fp)
        lw         $t1, 4($fp)
        subu       $t0,$t1
        li         $t2, 7
        addu       $t0,$t2
        li         $t3, 0
        bge        $t0,$t3
        beq        $t0, 0, L_10
        lw         $t4, -12($fp)
        lw         $t5, 4($fp)
        subu       $t4,$t5
        li         $t6, 7
        addu       $t4,$t6
        lw         $t7, -8($fp)
        li         $t8, -16
        addu       $t7,$t8
        lw         $t7
        lw         $t7
        blt        $t4,$t7
        move       $t0, $t4
L_10:
ASSERT_10:
        li         $v0,10
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(4)))),
#                    IntValue(0)),
#              Binop("LT",
#                    Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(4)))),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(-20)))))))
#
        lw         $t0, -12($fp)
        lw         $t1, 4($fp)
        addu       $t0,$t1
        li         $t2, 0
        bge        $t0,$t2
        beq        $t0, 0, L_11
        lw         $t3, -12($fp)
        lw         $t4, 4($fp)
        addu       $t3,$t4
        lw         $t5, -8($fp)
        li         $t6, -20
        addu       $t5,$t6
        lw         $t5
        lw         $t5
        blt        $t3,$t5
        move       $t0, $t3
L_11:
ASSERT_11:
        li         $v0,11
        beq        $t0, 0, AssertionFailure
#
# CJump(Binop("AND",
#             Binop("AND",
#                   Mem(Binop("PLUS",
#                             Mem(Binop("PLUS",
#                                       Mem(Binop("PLUS",
#                                                 Reg("fp"),
#                                                 IntValue(-8))),
#                                       IntValue(-24))),
#                             Binop("TIMES",
#                                   Binop("PLUS",
#                                         Mem(Binop("PLUS",
#                                                   Reg("fp"),
#                                                   IntValue(-12))),
#                                         IntValue(1)),
#                                   IntValue(4)))),
#                   Mem(Binop("PLUS",
#                             Mem(Binop("PLUS",
#                                       Mem(Binop("PLUS",
#                                                 Reg("fp"),
#                                                 IntValue(-8))),
#                                       IntValue(-16))),
#                             Binop("TIMES",
#                                   Binop("PLUS",
#                                         Binop("PLUS",
#                                               Binop("MINUS",
#                                                     Mem(Binop("PLUS",
#                                                               Reg("fp"),
#                                                               IntValue(-12))),
#                                                     Mem(Binop("PLUS",
#                                                               Reg("fp"),
#                                                               IntValue(4)))),
#                                               IntValue(7)),
#                                         IntValue(1)),
#                                   IntValue(4))))),
#             Mem(Binop("PLUS",
#                       Mem(Binop("PLUS",
#                                 Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                 IntValue(-20))),
#                       Binop("TIMES",
#                             Binop("PLUS",
#                                   Binop("PLUS",
#                                         Mem(Binop("PLUS",
#                                                   Reg("fp"),
#                                                   IntValue(-12))),
#                                         Mem(Binop("PLUS",
#                                                   Reg("fp"),
#                                                   IntValue(4)))),
#                                   IntValue(1)),
#                             IntValue(4))))),
#       "exit_6")
#
        lw         $t0, -8($fp)
        li         $t1, -24
        addu       $t0,$t1
        lw         $t0
        lw         $t2, -12($fp)
        li         $t3, 1
        addu       $t2,$t3
        li         $t4, 4
        mult       $t2,$t4
        addu       $t0,$t2
        lw         $t0
        beq        $t0, 0, L_13
        lw         $t5, -8($fp)
        li         $t6, -16
        addu       $t5,$t6
        lw         $t5
        lw         $t7, -12($fp)
        lw         $t8, 4($fp)
        subu       $t7,$t8
        li         $t9, 7
        addu       $t7,$t9
        li         $s0, 1
        addu       $t7,$s0
        li         $s1, 4
        mult       $t7,$s1
        addu       $t5,$t7
        lw         $t5
        move       $t0, $t5
L_13:
        beq        $t0, 0, L_12
        lw         $t5, -8($fp)
        li         $s2, -20
        addu       $t5,$s2
        lw         $t5
        lw         $s3, -12($fp)
        lw         $s4, 4($fp)
        addu       $s3,$s4
        li         $s5, 1
        addu       $s3,$s5
        li         $s6, 4
        mult       $s3,$s6
        addu       $t5,$s3
        lw         $t5
        move       $t0, $t5
L_12:
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
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(-24)))))))
#
        lw         $t0, -12($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_14
        lw         $t2, -12($fp)
        lw         $t3, -8($fp)
        li         $t4, -24
        addu       $t3,$t4
        lw         $t3
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_14:
ASSERT_12:
        li         $v0,12
        beq        $t0, 0, AssertionFailure
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                          IntValue(-24))),
#                Binop("TIMES",
#                      Binop("PLUS",
#                            Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                            IntValue(1)),
#                      IntValue(4)))),
#      IntValue(0))
#
        lw         $t0, -8($fp)
        li         $t1, -24
        addu       $t0,$t1
        lw         $t0
        lw         $t2, -12($fp)
        li         $t3, 1
        addu       $t2,$t3
        li         $t4, 4
        mult       $t2,$t4
        addu       $t0,$t2
        li         $t5, 0
        sw         $t5, ($t0)
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Binop("PLUS",
#                          Binop("MINUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(4)))),
#                          IntValue(7)),
#                    IntValue(0)),
#              Binop("LT",
#                    Binop("PLUS",
#                          Binop("MINUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(4)))),
#                          IntValue(7)),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(-16)))))))
#
        lw         $t0, -12($fp)
        lw         $t1, 4($fp)
        subu       $t0,$t1
        li         $t2, 7
        addu       $t0,$t2
        li         $t3, 0
        bge        $t0,$t3
        beq        $t0, 0, L_15
        lw         $t4, -12($fp)
        lw         $t5, 4($fp)
        subu       $t4,$t5
        li         $t6, 7
        addu       $t4,$t6
        lw         $t7, -8($fp)
        li         $t8, -16
        addu       $t7,$t8
        lw         $t7
        lw         $t7
        blt        $t4,$t7
        move       $t0, $t4
L_15:
ASSERT_13:
        li         $v0,13
        beq        $t0, 0, AssertionFailure
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                          IntValue(-16))),
#                Binop("TIMES",
#                      Binop("PLUS",
#                            Binop("PLUS",
#                                  Binop("MINUS",
#                                        Mem(Binop("PLUS",
#                                                  Reg("fp"),
#                                                  IntValue(-12))),
#                                        Mem(Binop("PLUS",
#                                                  Reg("fp"),
#                                                  IntValue(4)))),
#                                  IntValue(7)),
#                            IntValue(1)),
#                      IntValue(4)))),
#      IntValue(0))
#
        lw         $t0, -8($fp)
        li         $t1, -16
        addu       $t0,$t1
        lw         $t0
        lw         $t2, -12($fp)
        lw         $t3, 4($fp)
        subu       $t2,$t3
        li         $t4, 7
        addu       $t2,$t4
        li         $t5, 1
        addu       $t2,$t5
        li         $t6, 4
        mult       $t2,$t6
        addu       $t0,$t2
        li         $t7, 0
        sw         $t7, ($t0)
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(4)))),
#                    IntValue(0)),
#              Binop("LT",
#                    Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(4)))),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(-20)))))))
#
        lw         $t0, -12($fp)
        lw         $t1, 4($fp)
        addu       $t0,$t1
        li         $t2, 0
        bge        $t0,$t2
        beq        $t0, 0, L_16
        lw         $t3, -12($fp)
        lw         $t4, 4($fp)
        addu       $t3,$t4
        lw         $t5, -8($fp)
        li         $t6, -20
        addu       $t5,$t6
        lw         $t5
        lw         $t5
        blt        $t3,$t5
        move       $t0, $t3
L_16:
ASSERT_14:
        li         $v0,14
        beq        $t0, 0, AssertionFailure
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                          IntValue(-20))),
#                Binop("TIMES",
#                      Binop("PLUS",
#                            Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(4)))),
#                            IntValue(1)),
#                      IntValue(4)))),
#      IntValue(0))
#
        lw         $t0, -8($fp)
        li         $t1, -20
        addu       $t0,$t1
        lw         $t0
        lw         $t2, -12($fp)
        lw         $t3, 4($fp)
        addu       $t2,$t3
        li         $t4, 1
        addu       $t2,$t4
        li         $t5, 4
        mult       $t2,$t5
        addu       $t0,$t2
        li         $t6, 0
        sw         $t6, ($t0)
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(-28)))))))
#
        lw         $t0, 4($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_17
        lw         $t2, 4($fp)
        lw         $t3, -8($fp)
        li         $t4, -28
        addu       $t3,$t4
        lw         $t3
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_17:
ASSERT_15:
        li         $v0,15
        beq        $t0, 0, AssertionFailure
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                          IntValue(-28))),
#                Binop("TIMES",
#                      Binop("PLUS",
#                            Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                            IntValue(1)),
#                      IntValue(4)))),
#      Mem(Binop("PLUS", Reg("fp"), IntValue(-12))))
#
        lw         $t0, -8($fp)
        li         $t1, -28
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
# CJump(Binop("EQ", Mem(Binop("PLUS", Reg("fp"), IntValue(4))), IntValue(7)),
#       "exit_8")
#
        lw         $t0, 4($fp)
        li         $t1, 7
        beq        $t0,$t1
        beq        $t0, 1, exit_8
#
# CallP("queens_2",
#       Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#       List(Binop("PLUS",
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                  IntValue(1))))
#
        subu       $sp, $sp, 4
        lw         $t0, 4($fp)
        li         $t1, 1
        addu       $t0,$t1
        sw         $t0, 4($sp)
        lw         $t0, -8($fp)
        move       $v0, $t0
        jal        queens_2
        addu       $sp, $sp, 4
        move       $t0, $a0
#
# Jump("cont_7")
#
        jr         cont_7
#
# Label("exit_8")
#
exit_8:
#
# CallP("print_1", Mem(Binop("PLUS", Reg("fp"), IntValue(-8))), List())
#
        lw         $t0, -8($fp)
        move       $v0, $t0
        jal        print_1
        move       $t0, $a0
#
# Label("cont_7")
#
cont_7:
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(-24)))))))
#
        lw         $t0, -12($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_18
        lw         $t2, -12($fp)
        lw         $t3, -8($fp)
        li         $t4, -24
        addu       $t3,$t4
        lw         $t3
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_18:
ASSERT_16:
        li         $v0,16
        beq        $t0, 0, AssertionFailure
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                          IntValue(-24))),
#                Binop("TIMES",
#                      Binop("PLUS",
#                            Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                            IntValue(1)),
#                      IntValue(4)))),
#      IntValue(1))
#
        lw         $t0, -8($fp)
        li         $t1, -24
        addu       $t0,$t1
        lw         $t0
        lw         $t2, -12($fp)
        li         $t3, 1
        addu       $t2,$t3
        li         $t4, 4
        mult       $t2,$t4
        addu       $t0,$t2
        li         $t5, 1
        sw         $t5, ($t0)
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Binop("PLUS",
#                          Binop("MINUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(4)))),
#                          IntValue(7)),
#                    IntValue(0)),
#              Binop("LT",
#                    Binop("PLUS",
#                          Binop("MINUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(4)))),
#                          IntValue(7)),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(-16)))))))
#
        lw         $t0, -12($fp)
        lw         $t1, 4($fp)
        subu       $t0,$t1
        li         $t2, 7
        addu       $t0,$t2
        li         $t3, 0
        bge        $t0,$t3
        beq        $t0, 0, L_19
        lw         $t4, -12($fp)
        lw         $t5, 4($fp)
        subu       $t4,$t5
        li         $t6, 7
        addu       $t4,$t6
        lw         $t7, -8($fp)
        li         $t8, -16
        addu       $t7,$t8
        lw         $t7
        lw         $t7
        blt        $t4,$t7
        move       $t0, $t4
L_19:
ASSERT_17:
        li         $v0,17
        beq        $t0, 0, AssertionFailure
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                          IntValue(-16))),
#                Binop("TIMES",
#                      Binop("PLUS",
#                            Binop("PLUS",
#                                  Binop("MINUS",
#                                        Mem(Binop("PLUS",
#                                                  Reg("fp"),
#                                                  IntValue(-12))),
#                                        Mem(Binop("PLUS",
#                                                  Reg("fp"),
#                                                  IntValue(4)))),
#                                  IntValue(7)),
#                            IntValue(1)),
#                      IntValue(4)))),
#      IntValue(1))
#
        lw         $t0, -8($fp)
        li         $t1, -16
        addu       $t0,$t1
        lw         $t0
        lw         $t2, -12($fp)
        lw         $t3, 4($fp)
        subu       $t2,$t3
        li         $t4, 7
        addu       $t2,$t4
        li         $t5, 1
        addu       $t2,$t5
        li         $t6, 4
        mult       $t2,$t6
        addu       $t0,$t2
        li         $t7, 1
        sw         $t7, ($t0)
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(4)))),
#                    IntValue(0)),
#              Binop("LT",
#                    Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(4)))),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(-20)))))))
#
        lw         $t0, -12($fp)
        lw         $t1, 4($fp)
        addu       $t0,$t1
        li         $t2, 0
        bge        $t0,$t2
        beq        $t0, 0, L_20
        lw         $t3, -12($fp)
        lw         $t4, 4($fp)
        addu       $t3,$t4
        lw         $t5, -8($fp)
        li         $t6, -20
        addu       $t5,$t6
        lw         $t5
        lw         $t5
        blt        $t3,$t5
        move       $t0, $t3
L_20:
ASSERT_18:
        li         $v0,18
        beq        $t0, 0, AssertionFailure
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                          IntValue(-20))),
#                Binop("TIMES",
#                      Binop("PLUS",
#                            Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(4)))),
#                            IntValue(1)),
#                      IntValue(4)))),
#      IntValue(1))
#
        lw         $t0, -8($fp)
        li         $t1, -20
        addu       $t0,$t1
        lw         $t0
        lw         $t2, -12($fp)
        lw         $t3, 4($fp)
        addu       $t2,$t3
        li         $t4, 1
        addu       $t2,$t4
        li         $t5, 4
        mult       $t2,$t5
        addu       $t0,$t2
        li         $t6, 1
        sw         $t6, ($t0)
#
# Label("cont_5")
#
cont_5:
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-12))), IntValue(1)))
#
        lw         $t0, -12($fp)
        li         $t1, 1
        addu       $t0,$t1
        sw         $t0, -12($fp)
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
# Move(Reg("sp"), Binop("PLUS", Reg("sp"), IntValue(-80)))
#
        li         $t0, -80
        addu       $sp,$t0
        move       $sp,$sp
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-12))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -12($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-32))),
#      Allocate(Binop("PLUS",
#                     Binop("PLUS", IntValue(0), IntValue(15)),
#                     IntValue(1))))
#
        li         $t0, 0
        li         $t1, 15
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
#      Binop("PLUS", IntValue(0), IntValue(15)))
#
        lw         $t0, -32($fp)
        li         $t1, 0
        li         $t2, 15
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
# Label("loop_12")
#
loop_12:
#
# CJump(Binop("GEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(-40))), IntValue(15)),
#       "exit_13")
#
        lw         $t0, -40($fp)
        li         $t1, 15
        bge        $t0,$t1
        beq        $t0, 1, exit_13
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-32))),
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-36))))),
#      IntValue(1))
#
        lw         $t0, -32($fp)
        lw         $t1, -36($fp)
        addu       $t0,$t1
        li         $t2, 1
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
# Jump("loop_12")
#
        jr         loop_12
#
# Label("exit_13")
#
exit_13:
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#      Mem(Binop("PLUS", Reg("fp"), IntValue(-32))))
#
        lw         $t0, -32($fp)
        sw         $t0, -16($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-44))),
#      Allocate(Binop("PLUS",
#                     Binop("PLUS", IntValue(0), IntValue(15)),
#                     IntValue(1))))
#
        li         $t0, 0
        li         $t1, 15
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
#      Binop("PLUS", IntValue(0), IntValue(15)))
#
        lw         $t0, -44($fp)
        li         $t1, 0
        li         $t2, 15
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
# Label("loop_17")
#
loop_17:
#
# CJump(Binop("GEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(-52))), IntValue(15)),
#       "exit_18")
#
        lw         $t0, -52($fp)
        li         $t1, 15
        bge        $t0,$t1
        beq        $t0, 1, exit_18
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-44))),
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-48))))),
#      IntValue(1))
#
        lw         $t0, -44($fp)
        lw         $t1, -48($fp)
        addu       $t0,$t1
        li         $t2, 1
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
# Jump("loop_17")
#
        jr         loop_17
#
# Label("exit_18")
#
exit_18:
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-20))),
#      Mem(Binop("PLUS", Reg("fp"), IntValue(-44))))
#
        lw         $t0, -44($fp)
        sw         $t0, -20($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-56))),
#      Allocate(Binop("PLUS",
#                     Binop("PLUS", IntValue(0), IntValue(15)),
#                     IntValue(1))))
#
        li         $t0, 0
        li         $t1, 15
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
#      Binop("PLUS", IntValue(0), IntValue(15)))
#
        lw         $t0, -56($fp)
        li         $t1, 0
        li         $t2, 15
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
# Label("loop_22")
#
loop_22:
#
# CJump(Binop("GEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(-64))), IntValue(15)),
#       "exit_23")
#
        lw         $t0, -64($fp)
        li         $t1, 15
        bge        $t0,$t1
        beq        $t0, 1, exit_23
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-56))),
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-60))))),
#      IntValue(1))
#
        lw         $t0, -56($fp)
        lw         $t1, -60($fp)
        addu       $t0,$t1
        li         $t2, 1
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
# Jump("loop_22")
#
        jr         loop_22
#
# Label("exit_23")
#
exit_23:
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-24))),
#      Mem(Binop("PLUS", Reg("fp"), IntValue(-56))))
#
        lw         $t0, -56($fp)
        sw         $t0, -24($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-68))),
#      Allocate(Binop("PLUS",
#                     Binop("PLUS", IntValue(0), IntValue(8)),
#                     IntValue(1))))
#
        li         $t0, 0
        li         $t1, 8
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
#      Binop("PLUS", IntValue(0), IntValue(8)))
#
        lw         $t0, -68($fp)
        li         $t1, 0
        li         $t2, 8
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
# Label("loop_27")
#
loop_27:
#
# CJump(Binop("GEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(-76))), IntValue(8)),
#       "exit_28")
#
        lw         $t0, -76($fp)
        li         $t1, 8
        bge        $t0,$t1
        beq        $t0, 1, exit_28
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-68))),
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-72))))),
#      Unop("MINUS", IntValue(1)))
#
        lw         $t0, -68($fp)
        lw         $t1, -72($fp)
        addu       $t0,$t1
        li         $t2, 1
        neg        $t2,$t2
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
# Jump("loop_27")
#
        jr         loop_27
#
# Label("exit_28")
#
exit_28:
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-28))),
#      Mem(Binop("PLUS", Reg("fp"), IntValue(-68))))
#
        lw         $t0, -68($fp)
        sw         $t0, -28($fp)
#
# CallP("queens_2", Reg("fp"), List(IntValue(0)))
#
        subu       $sp, $sp, 4
        li         $t0, 0
        sw         $t0, 4($sp)
        move       $v0, $fp
        jal        queens_2
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
