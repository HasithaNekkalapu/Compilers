#
# Label("mark_1")
#
mark_1:
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
#             Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#             Mem(Binop("PLUS",
#                       Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                       IntValue(-12)))),
#       "exit_3")
#
        lw         $t0, 4($fp)
        lw         $t1, -8($fp)
        li         $t2, -12
        addu       $t1,$t2
        lw         $t1
        blt        $t0,$t1
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
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                    Mem(Mem(Binop("PLUS",
#                                  Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                                  IntValue(-16)))))))
#
        lw         $t0, 4($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_1
        lw         $t2, 4($fp)
        lw         $t3, -8($fp)
        li         $t4, -16
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
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                          IntValue(-16))),
#                Binop("TIMES",
#                      Binop("PLUS",
#                            Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                            IntValue(1)),
#                      IntValue(4)))),
#      IntValue(0))
#
        lw         $t0, -8($fp)
        li         $t1, -16
        addu       $t0,$t1
        lw         $t0
        lw         $t2, 4($fp)
        li         $t3, 1
        addu       $t2,$t3
        li         $t4, 4
        mult       $t2,$t4
        addu       $t0,$t2
        li         $t5, 0
        sw         $t5, ($t0)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#      Binop("PLUS",
#            Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                      IntValue(-32)))))
#
        lw         $t0, 4($fp)
        lw         $t1, -8($fp)
        li         $t2, -32
        addu       $t1,$t2
        lw         $t1
        addu       $t0,$t1
        sw         $t0, 4($fp)
#
# CallP("mark_1",
#       Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#       List(Mem(Binop("PLUS", Reg("fp"), IntValue(4)))))
#
        subu       $sp, $sp, 4
        lw         $t0, 4($fp)
        sw         $t0, 4($sp)
        lw         $t0, -8($fp)
        move       $v0, $t0
        jal        mark_1
        addu       $sp, $sp, 4
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
# Move(Reg("sp"), Binop("PLUS", Reg("sp"), IntValue(-52)))
#
        li         $t0, -52
        addu       $sp,$t0
        move       $sp,$sp
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-12))), IntValue(8190))
#
        li         $t0, 8190
        sw         $t0, -12($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-40))),
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
        sw         $t4, -40($fp)
#
# Move(Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-40)))),
#      Binop("PLUS", IntValue(0), Mem(Binop("PLUS", Reg("fp"), IntValue(-12)))))
#
        lw         $t0, -40($fp)
        li         $t1, 0
        lw         $t2, -12($fp)
        addu       $t1,$t2
        sw         $t1, ($t0)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-44))), IntValue(4))
#
        li         $t0, 4
        sw         $t0, -44($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-48))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -48($fp)
#
# Label("loop_11")
#
loop_11:
#
# CJump(Binop("GEQ",
#             Mem(Binop("PLUS", Reg("fp"), IntValue(-48))),
#             Mem(Binop("PLUS", Reg("fp"), IntValue(-12)))),
#       "exit_12")
#
        lw         $t0, -48($fp)
        lw         $t1, -12($fp)
        bge        $t0,$t1
        beq        $t0, 1, exit_12
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-40))),
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-44))))),
#      IntValue(1))
#
        lw         $t0, -40($fp)
        lw         $t1, -44($fp)
        addu       $t0,$t1
        li         $t2, 1
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-44))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-44))), IntValue(4)))
#
        lw         $t0, -44($fp)
        li         $t1, 4
        addu       $t0,$t1
        sw         $t0, -44($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-48))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-48))), IntValue(1)))
#
        lw         $t0, -48($fp)
        li         $t1, 1
        addu       $t0,$t1
        sw         $t0, -48($fp)
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
#      Mem(Binop("PLUS", Reg("fp"), IntValue(-40))))
#
        lw         $t0, -40($fp)
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
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-32))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -32($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-36))), IntValue(0))
#
        li         $t0, 0
        sw         $t0, -36($fp)
#
# Label("loop_4")
#
loop_4:
#
# CJump(Unop("NOT",
#            Binop("LT",
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(-24))),
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(-12))))),
#       "exit_5")
#
        lw         $t0, -24($fp)
        lw         $t1, -12($fp)
        blt        $t0,$t1
        seq        $t0,$t0, 0
        beq        $t0, 1, exit_5
#
# Assert(Binop("AND",
#              Binop("GEQ",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-24))),
#                    IntValue(0)),
#              Binop("LT",
#                    Mem(Binop("PLUS", Reg("fp"), IntValue(-24))),
#                    Mem(Mem(Binop("PLUS", Reg("fp"), IntValue(-16)))))))
#
        lw         $t0, -24($fp)
        li         $t1, 0
        bge        $t0,$t1
        beq        $t0, 0, L_2
        lw         $t2, -24($fp)
        lw         $t3, -16($fp)
        lw         $t3
        blt        $t2,$t3
        move       $t0, $t2
L_2:
ASSERT_2:
        li         $v0,2
        beq        $t0, 0, AssertionFailure
#
# CJump(Binop("EQ",
#             Mem(Binop("PLUS",
#                       Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                       Binop("TIMES",
#                             Binop("PLUS",
#                                   Mem(Binop("PLUS", Reg("fp"), IntValue(-24))),
#                                   IntValue(1)),
#                             IntValue(4)))),
#             IntValue(1)),
#       "exit_7")
#
        lw         $t0, -16($fp)
        lw         $t1, -24($fp)
        li         $t2, 1
        addu       $t1,$t2
        li         $t3, 4
        mult       $t1,$t3
        addu       $t0,$t1
        lw         $t0
        li         $t4, 1
        beq        $t0,$t4
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
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-32))),
#      Binop("PLUS",
#            Binop("PLUS",
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(-24))),
#                  Mem(Binop("PLUS", Reg("fp"), IntValue(-24)))),
#            IntValue(3)))
#
        lw         $t0, -24($fp)
        lw         $t1, -24($fp)
        addu       $t0,$t1
        li         $t2, 3
        addu       $t0,$t2
        sw         $t0, -32($fp)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-28))),
#      Binop("PLUS",
#            Mem(Binop("PLUS", Reg("fp"), IntValue(-24))),
#            Mem(Binop("PLUS", Reg("fp"), IntValue(-32)))))
#
        lw         $t0, -24($fp)
        lw         $t1, -32($fp)
        addu       $t0,$t1
        sw         $t0, -28($fp)
#
# CallP("mark_1",
#       Reg("fp"),
#       List(Mem(Binop("PLUS", Reg("fp"), IntValue(-28)))))
#
        subu       $sp, $sp, 4
        lw         $t0, -28($fp)
        sw         $t0, 4($sp)
        move       $v0, $fp
        jal        mark_1
        addu       $sp, $sp, 4
        move       $t0, $a0
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-36))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-36))), IntValue(1)))
#
        lw         $t0, -36($fp)
        li         $t1, 1
        addu       $t0,$t1
        sw         $t0, -36($fp)
#
# Label("cont_6")
#
cont_6:
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-24))),
#      Binop("PLUS", Mem(Binop("PLUS", Reg("fp"), IntValue(-24))), IntValue(1)))
#
        lw         $t0, -24($fp)
        li         $t1, 1
        addu       $t0,$t1
        sw         $t0, -24($fp)
#
# Jump("loop_4")
#
        jr         loop_4
#
# Label("exit_5")
#
exit_5:
#
# SystemCall("WRITE_STRING",
#            StringValue("The number of prime numbers less than "))
#
        li         $t0, The number of prime numbers less than 
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
# SystemCall("WRITE_STRING", StringValue("is "))
#
        li         $t0,  is 
        move       $a0,$t0
        li         $v0,4
        syscall
#
# SystemCall("WRITE_INT", Mem(Binop("PLUS", Reg("fp"), IntValue(-36))))
#
        lw         $t0, -36($fp)
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
