#
# Label("init_1")
#
init_1:
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
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-12))), IntValue(2))
#
        li         $t0, 2
        sw         $t0, -12($fp)
#
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(0), IntValue(0)),
#              Binop("LT",
#                    IntValue(0),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(4)))))))
#
        li         $t0, 0
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_1
        li         $t2, 0
        lw         $t3, 4($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_1:
ASSERT_1:
        li         $v0,1
        beq        $t0, 0, AssertionFailure
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                Binop("TIMES",
#                      Binop("PLUS", IntValue(0), IntValue(1)),
#                      IntValue(4)))),
#      IntValue(1))
#
        lw         $t0, 4($fp)
        li         $t1, 0
        li         $t2, 1
        addu       $t1,$t2
        li         $t3, 4
        mult       $t1,$t3
        addu       $t0,$t1
        li         $t4, 1
        sw         $t4, ($t0)
#
# Assert(Binop("AND",
#              Binop("GEQ", IntValue(1), IntValue(0)),
#              Binop("LT",
#                    IntValue(1),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(4)))))))
#
        li         $t0, 1
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_2
        li         $t2, 1
        lw         $t3, 4($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_2:
ASSERT_2:
        li         $v0,2
        beq        $t0, 0, AssertionFailure
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                Binop("TIMES",
#                      Binop("PLUS", IntValue(1), IntValue(1)),
#                      IntValue(4)))),
#      IntValue(1))
#
        lw         $t0, 4($fp)
        li         $t1, 1
        li         $t2, 1
        addu       $t1,$t2
        li         $t3, 4
        mult       $t1,$t3
        addu       $t0,$t1
        li         $t4, 1
        sw         $t4, ($t0)
#
# Label("loop_2")
#
loop_2:
#
# CJump(Unop("NOT",
#            Binop("LT",
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                  Binop("MINUS",
#                        Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(-12))),
#                        IntValue(1)))),
#       "exit_3")
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
        beq        $t0, 1, exit_3
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(4)))))))
#
        lw         $t0, -12($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_3
        lw         $t2, -12($fp)
        lw         $t3, 4($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_3:
ASSERT_3:
        li         $v0,3
        beq        $t0, 0, AssertionFailure
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                Binop("TIMES",
#                      Binop("PLUS",
#                            Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                            IntValue(1)),
#                      IntValue(4)))),
#      Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                IntValue(-16))))
#
        lw         $t0, 4($fp)
        lw         $t1, -12($fp)
        li         $t2, 1
        addu       $t1,$t2
        li         $t3, 4
        mult       $t1,$t3
        addu       $t0,$t1
        lw         $t4, -8($fp)
        li         $t5, -16
        addu       $t4,$t5
        lw         $t4
        sw         $t4, ($t0)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-12))), IntValue(1)))
#
        lw         $t0, -12($fp)
        li         $t1, 1
        addu       $t0,$t1
        sw         $t0, -12($fp)
#
# Jump("loop_2")
#
        jr         loop_2
#
# Label("exit_3")
#
exit_3:
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
# Label("fibb_4")
#
fibb_4:
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
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(-20)))))))
#
        lw         $t0, 4($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_4
        lw         $t2, 4($fp)
        lw         $t3, -8($fp)
        li         $t4, -20
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
# CJump(Binop("EQ",
#             Mem(Binop("PLUS",
#                       Mem(Binop("PLUS",
#                                 Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                 IntValue(-20))),
#                       Binop("TIMES",
#                             Binop("PLUS",
#                                   Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                                   IntValue(1)),
#                             IntValue(4)))),
#             Mem(Binop("PLUS",
#                       Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                       IntValue(-16)))),
#       "exit_6")
#
        lw         $t0, -8($fp)
        li         $t1, -20
        addu       $t0,$t1
        lw         $t0
        lw         $t2, 4($fp)
        li         $t3, 1
        addu       $t2,$t3
        li         $t4, 4
        mult       $t2,$t4
        addu       $t0,$t2
        lw         $t0
        lw         $t5, -8($fp)
        li         $t6, -16
        addu       $t5,$t6
        lw         $t5
        beq        $t0,$t5
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
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(-20)))))))
#
        lw         $t0, 4($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_5
        lw         $t2, 4($fp)
        lw         $t3, -8($fp)
        li         $t4, -20
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
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                          IntValue(-20))),
#                Binop("TIMES",
#                      Binop("PLUS",
#                            Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                            IntValue(1)),
#                      IntValue(4)))),
#      Binop("PLUS",
#            Call("fibb_4",
#                 Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                 List(Binop("MINUS",
#                            Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                            IntValue(2)))),
#            Call("fibb_4",
#                 Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                 List(Binop("MINUS",
#                            Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                            IntValue(1))))))
#
        lw         $t0, -8($fp)
        li         $t1, -20
        addu       $t0,$t1
        lw         $t0
        lw         $t2, 4($fp)
        li         $t3, 1
        addu       $t2,$t3
        li         $t4, 4
        mult       $t2,$t4
        addu       $t0,$t2
        subu       $sp, $sp, 24
        sw         $t0, 24($sp)
        sw         $t1, 20($sp)
        sw         $t2, 16($sp)
        sw         $t3, 12($sp)
        sw         $t4, 8($sp)
        lw         $t5, 4($fp)
        li         $t6, 2
        subu       $t5,$t6
        sw         $t5, 4($sp)
        lw         $t5, -8($fp)
        move       $v0, $t5
        jal        fibb_4
        lw         $t0, 24($sp)
        lw         $t1, 20($sp)
        lw         $t2, 16($sp)
        lw         $t3, 12($sp)
        lw         $t4, 8($sp)
        addu       $sp, $sp, 24
        move       $t5, $a0
        subu       $sp, $sp, 32
        sw         $t0, 32($sp)
        sw         $t1, 28($sp)
        sw         $t2, 24($sp)
        sw         $t3, 20($sp)
        sw         $t4, 16($sp)
        sw         $t5, 12($sp)
        sw         $t6, 8($sp)
        lw         $t7, 4($fp)
        li         $t8, 1
        subu       $t7,$t8
        sw         $t7, 4($sp)
        lw         $t7, -8($fp)
        move       $v0, $t7
        jal        fibb_4
        lw         $t0, 32($sp)
        lw         $t1, 28($sp)
        lw         $t2, 24($sp)
        lw         $t3, 20($sp)
        lw         $t4, 16($sp)
        lw         $t5, 12($sp)
        lw         $t6, 8($sp)
        addu       $sp, $sp, 32
        move       $t7, $a0
        addu       $t5,$t7
        sw         $t5, ($t0)
#
# Label("cont_5")
#
cont_5:
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(-20)))))))
#
        lw         $t0, 4($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_6
        lw         $t2, 4($fp)
        lw         $t3, -8($fp)
        li         $t4, -20
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
# Move(Reg("a0"),
#      Mem(Binop("PLUS",
#                Mem(Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                          IntValue(-20))),
#                Binop("TIMES",
#                      Binop("PLUS",
#                            Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                            IntValue(1)),
#                      IntValue(4)))))
#
        lw         $t0, -8($fp)
        li         $t1, -20
        addu       $t0,$t1
        lw         $t0
        lw         $t2, 4($fp)
        li         $t3, 1
        addu       $t2,$t3
        li         $t4, 4
        mult       $t2,$t4
        addu       $t0,$t2
        lw         $a0,($t0)
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
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-12))), IntValue(40))
#
        li         $t0, 40
        sw         $t0, -12($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-16))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -16($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-32))),
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
        sw         $t4, -32($fp)
#
# Move(Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-32)))),
#      Binop("PLUS", IntValue(0), Mem(Binop("PLUS", Reg("fp"), IntValue(-12)))))
#
        lw         $t0, -32($fp)
        li         $t1, 0
        lw         $t2, -12($fp)
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
# Label("loop_14")
#
loop_14:
#
# CJump(Binop("GEQ",
#             Mem(Binop("PLUS", Reg("fp"), IntValue(-40))),
#             Mem(Binop("PLUS", Reg("fp"), IntValue(-12)))),
#       "exit_15")
#
        lw         $t0, -40($fp)
        lw         $t1, -12($fp)
        bge        $t0,$t1
        beq        $t0, 1, exit_15
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-32))),
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-36))))),
#      IntValue(0))
#
        lw         $t0, -32($fp)
        lw         $t1, -36($fp)
        addu       $t0,$t1
        li         $t2, 0
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
# Jump("loop_14")
#
        jr         loop_14
#
# Label("exit_15")
#
exit_15:
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-20))),
#      Mem(Binop("PLUS", Reg("fp"), IntValue(-32))))
#
        lw         $t0, -32($fp)
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
# CallP("init_1",
#       Reg("fp"),
#       List(Mem(Binop("PLUS", Reg("fp"), IntValue(-20)))))
#
        subu       $sp, $sp, 4
        lw         $t0, -20($fp)
        sw         $t0, 4($sp)
        move       $v0, $fp
        jal        init_1
        addu       $sp, $sp, 4
        move       $t0, $a0
#
# SystemCall("WRITE_STRING",
#            StringValue("Enter indices of eight fibbonacci numbers:"))
#
        li         $t0, Enter indices of eight fibbonacci numbers:
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
# Label("loop_7")
#
loop_7:
#
# CJump(Unop("NOT",
#            Binop("LT",
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(-24))),
#                  IntValue(8))),
#       "exit_8")
#
        lw         $t0, -24($fp)
        li         $t1, 8
        blt        $t0,$t1
        seq        $t0,$t0, 0
        beq        $t0, 1, exit_8
#
# SystemCall("READ_INT", Mem(Binop("PLUS", Reg("fp"), IntValue(-28))))
#
        lw         $t0, -28($fp)
        move       $a0,$t0
        li         $v0,()
        syscall
#
# CJump(Binop("GEQ",
#             Mem(Binop("PLUS", Reg("fp"), IntValue(-28))),
#             Mem(Binop("PLUS", Reg("fp"), IntValue(-12)))),
#       "exit_10")
#
        lw         $t0, -28($fp)
        lw         $t1, -12($fp)
        bge        $t0,$t1
        beq        $t0, 1, exit_10
#
# SystemCall("WRITE_INT", Mem(Binop("PLUS", Reg("fp"), IntValue(-28))))
#
        lw         $t0, -28($fp)
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
# SystemCall("WRITE_INT",
#            Call("fibb_4",
#                 Reg("fp"),
#                 List(Mem(Binop("PLUS", Reg("fp"), IntValue(-28))))))
#
        subu       $sp, $sp, 4
        lw         $t0, -28($fp)
        sw         $t0, 4($sp)
        move       $v0, $fp
        jal        fibb_4
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
# Jump("cont_9")
#
        jr         cont_9
#
# Label("exit_10")
#
exit_10:
#
# SystemCall("WRITE_STRING", StringValue("Maximum index is "))
#
        li         $t0, Maximum index is 
        move       $a0,$t0
        li         $v0,4
        syscall
#
# SystemCall("WRITE_INT",
#            Binop("MINUS",
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                  IntValue(1)))
#
        lw         $t0, -12($fp)
        li         $t1, 1
        subu       $t0,$t1
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
# Label("cont_9")
#
cont_9:
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
