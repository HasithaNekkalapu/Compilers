#
# Label("preorder_1")
#
preorder_1:
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
# CJump(Binop("NEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(4))), IntValue(0)),
#       "exit_3")
#
        lw         $t0, 4($fp)
        li         $t1, 0
        bne        $t0,$t1
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
# Assert(Binop("NEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(4))), IntValue(0)))
#
        lw         $t0, 4($fp)
        li         $t1, 0
        bne        $t0,$t1
ASSERT_1:
        li         $v0,1
        beq        $t0, 0, AssertionFailure
#
# SystemCall("WRITE_INT",
#            Mem(Binop("PLUS",
#                      Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                      IntValue(4))))
#
        lw         $t0, 4($fp)
        li         $t1, 4
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
ASSERT_2:
        li         $v0,2
        beq        $t0, 0, AssertionFailure
#
# CallP("preorder_1",
#       Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#       List(Mem(Binop("PLUS",
#                      Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                      IntValue(0)))))
#
        subu       $sp, $sp, 4
        lw         $t0, 4($fp)
        li         $t1, 0
        addu       $t0,$t1
        lw         $t0
        sw         $t0, 4($sp)
        lw         $t0, -8($fp)
        move       $v0, $t0
        jal        preorder_1
        addu       $sp, $sp, 4
        move       $t0, $a0
#
# Assert(Binop("NEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(4))), IntValue(0)))
#
        lw         $t0, 4($fp)
        li         $t1, 0
        bne        $t0,$t1
ASSERT_3:
        li         $v0,3
        beq        $t0, 0, AssertionFailure
#
# CallP("preorder_1",
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
        jal        preorder_1
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
# Label("sum_4")
#
sum_4:
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
#       "exit_6")
#
        lw         $t0, 4($fp)
        li         $t1, 0
        beq        $t0,$t1
        beq        $t0, 1, exit_6
#
# Assert(Binop("NEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(4))), IntValue(0)))
#
        lw         $t0, 4($fp)
        li         $t1, 0
        bne        $t0,$t1
ASSERT_4:
        li         $v0,4
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("NEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(4))), IntValue(0)))
#
        lw         $t0, 4($fp)
        li         $t1, 0
        bne        $t0,$t1
ASSERT_5:
        li         $v0,5
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("NEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(4))), IntValue(0)))
#
        lw         $t0, 4($fp)
        li         $t1, 0
        bne        $t0,$t1
ASSERT_6:
        li         $v0,6
        beq        $t0, 0, AssertionFailure
#
# Move(Reg("a0"),
#      Binop("PLUS",
#            Binop("PLUS",
#                  Call("sum_4",
#                       Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                       List(Mem(Binop("PLUS",
#                                      Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                                      IntValue(0))))),
#                  Mem(Binop("PLUS",
#                            Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                            IntValue(4)))),
#            Call("sum_4",
#                 Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#                 List(Mem(Binop("PLUS",
#                                Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                                IntValue(8)))))))
#
        subu       $sp, $sp, 4
        lw         $t0, 4($fp)
        li         $t1, 0
        addu       $t0,$t1
        lw         $t0
        sw         $t0, 4($sp)
        lw         $t0, -8($fp)
        move       $v0, $t0
        jal        sum_4
        addu       $sp, $sp, 4
        move       $t0, $a0
        lw         $t2, 4($fp)
        li         $t3, 4
        addu       $t2,$t3
        lw         $t2
        addu       $t0,$t2
        subu       $sp, $sp, 20
        sw         $t0, 20($sp)
        sw         $t1, 16($sp)
        sw         $t2, 12($sp)
        sw         $t3, 8($sp)
        lw         $t4, 4($fp)
        li         $t5, 8
        addu       $t4,$t5
        lw         $t4
        sw         $t4, 4($sp)
        lw         $t4, -8($fp)
        move       $v0, $t4
        jal        sum_4
        lw         $t0, 20($sp)
        lw         $t1, 16($sp)
        lw         $t2, 12($sp)
        lw         $t3, 8($sp)
        addu       $sp, $sp, 20
        move       $t4, $a0
        addu       $t0,$t4
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
# Jump("cont_5")
#
        jr         cont_5
#
# Label("exit_6")
#
exit_6:
#
# Move(Reg("a0"), IntValue(0))
#
        li         $a0,0
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
# Label("reflect_7")
#
reflect_7:
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
# CJump(Binop("EQ", Mem(Binop("PLUS", Reg("fp"), IntValue(4))), IntValue(0)),
#       "exit_9")
#
        lw         $t0, 4($fp)
        li         $t1, 0
        beq        $t0,$t1
        beq        $t0, 1, exit_9
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
# Assert(Binop("NEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(4))), IntValue(0)))
#
        lw         $t0, 4($fp)
        li         $t1, 0
        bne        $t0,$t1
ASSERT_7:
        li         $v0,7
        beq        $t0, 0, AssertionFailure
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                IntValue(0))),
#      Call("reflect_7",
#           Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#           List(Mem(Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                          IntValue(8))))))
#
        lw         $t0, -12($fp)
        li         $t1, 0
        addu       $t0,$t1
        subu       $sp, $sp, 12
        sw         $t0, 12($sp)
        sw         $t1, 8($sp)
        lw         $t2, 4($fp)
        li         $t3, 8
        addu       $t2,$t3
        lw         $t2
        sw         $t2, 4($sp)
        lw         $t2, -8($fp)
        move       $v0, $t2
        jal        reflect_7
        lw         $t0, 12($sp)
        lw         $t1, 8($sp)
        addu       $sp, $sp, 12
        move       $t2, $a0
        sw         $t2, ($t0)
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
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                IntValue(4))),
#      Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                IntValue(4))))
#
        lw         $t0, -12($fp)
        li         $t1, 4
        addu       $t0,$t1
        lw         $t2, 4($fp)
        li         $t3, 4
        addu       $t2,$t3
        lw         $t2
        sw         $t2, ($t0)
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
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                IntValue(8))),
#      Call("reflect_7",
#           Mem(Binop("PLUS", Reg("fp"), IntValue(-8))),
#           List(Mem(Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(4))),
#                          IntValue(0))))))
#
        lw         $t0, -12($fp)
        li         $t1, 8
        addu       $t0,$t1
        subu       $sp, $sp, 12
        sw         $t0, 12($sp)
        sw         $t1, 8($sp)
        lw         $t2, 4($fp)
        li         $t3, 0
        addu       $t2,$t3
        lw         $t2
        sw         $t2, 4($sp)
        lw         $t2, -8($fp)
        move       $v0, $t2
        jal        reflect_7
        lw         $t0, 12($sp)
        lw         $t1, 8($sp)
        addu       $sp, $sp, 12
        move       $t2, $a0
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
# Jump("cont_8")
#
        jr         cont_8
#
# Label("exit_9")
#
exit_9:
#
# Move(Reg("a0"), IntValue(0))
#
        li         $a0,0
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
# Label("cont_8")
#
cont_8:
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
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-28))), Allocate(IntValue(3)))
#
        li         $t0, 3
        li         $t1, 4
        mult       $t0,$t1
        move       $t2, $gp
        addu       $gp, $gp, $t0
        sw         $t2, -28($fp)
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-28))),
#                IntValue(0))),
#      IntValue(0))
#
        lw         $t0, -28($fp)
        li         $t1, 0
        addu       $t0,$t1
        li         $t2, 0
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-28))),
#                IntValue(4))),
#      IntValue(3))
#
        lw         $t0, -28($fp)
        li         $t1, 4
        addu       $t0,$t1
        li         $t2, 3
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-28))),
#                IntValue(8))),
#      IntValue(0))
#
        lw         $t0, -28($fp)
        li         $t1, 8
        addu       $t0,$t1
        li         $t2, 0
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#      Mem(Binop("PLUS", Reg("fp"), IntValue(-28))))
#
        lw         $t0, -28($fp)
        sw         $t0, -12($fp)
#
# Assert(Binop("NEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(-12))), IntValue(0)))
#
        lw         $t0, -12($fp)
        li         $t1, 0
        bne        $t0,$t1
ASSERT_10:
        li         $v0,10
        beq        $t0, 0, AssertionFailure
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
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                IntValue(0))),
#      IntValue(0))
#
        lw         $t0, -16($fp)
        li         $t1, 0
        addu       $t0,$t1
        li         $t2, 0
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                IntValue(4))),
#      IntValue(2))
#
        lw         $t0, -16($fp)
        li         $t1, 4
        addu       $t0,$t1
        li         $t2, 2
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-16))),
#                IntValue(8))),
#      IntValue(0))
#
        lw         $t0, -16($fp)
        li         $t1, 8
        addu       $t0,$t1
        li         $t2, 0
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                IntValue(0))),
#      Mem(Binop("PLUS", Reg("fp"), IntValue(-16))))
#
        lw         $t0, -12($fp)
        li         $t1, 0
        addu       $t0,$t1
        lw         $t2, -16($fp)
        sw         $t2, ($t0)
#
# Assert(Binop("NEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(-12))), IntValue(0)))
#
        lw         $t0, -12($fp)
        li         $t1, 0
        bne        $t0,$t1
ASSERT_11:
        li         $v0,11
        beq        $t0, 0, AssertionFailure
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
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-20))),
#                IntValue(0))),
#      IntValue(0))
#
        lw         $t0, -20($fp)
        li         $t1, 0
        addu       $t0,$t1
        li         $t2, 0
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-20))),
#                IntValue(4))),
#      IntValue(4))
#
        lw         $t0, -20($fp)
        li         $t1, 4
        addu       $t0,$t1
        li         $t2, 4
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-20))),
#                IntValue(8))),
#      IntValue(0))
#
        lw         $t0, -20($fp)
        li         $t1, 8
        addu       $t0,$t1
        li         $t2, 0
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                IntValue(8))),
#      Mem(Binop("PLUS", Reg("fp"), IntValue(-20))))
#
        lw         $t0, -12($fp)
        li         $t1, 8
        addu       $t0,$t1
        lw         $t2, -20($fp)
        sw         $t2, ($t0)
#
# Assert(Binop("NEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(-12))), IntValue(0)))
#
        lw         $t0, -12($fp)
        li         $t1, 0
        bne        $t0,$t1
ASSERT_12:
        li         $v0,12
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("NEQ",
#              Mem(Binop("PLUS",
#                        Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                        IntValue(0))),
#              IntValue(0)))
#
        lw         $t0, -12($fp)
        li         $t1, 0
        addu       $t0,$t1
        lw         $t0
        li         $t2, 0
        bne        $t0,$t2
ASSERT_13:
        li         $v0,13
        beq        $t0, 0, AssertionFailure
#
# Assert(Binop("NEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(-12))), IntValue(0)))
#
        lw         $t0, -12($fp)
        li         $t1, 0
        bne        $t0,$t1
ASSERT_14:
        li         $v0,14
        beq        $t0, 0, AssertionFailure
#
# Move(Mem(Binop("PLUS", Reg("fp"), IntValue(-24))), Allocate(IntValue(3)))
#
        li         $t0, 3
        li         $t1, 4
        mult       $t0,$t1
        move       $t2, $gp
        addu       $gp, $gp, $t0
        sw         $t2, -24($fp)
#
# Assert(Binop("NEQ", Mem(Binop("PLUS", Reg("fp"), IntValue(-12))), IntValue(0)))
#
        lw         $t0, -12($fp)
        li         $t1, 0
        bne        $t0,$t1
ASSERT_15:
        li         $v0,15
        beq        $t0, 0, AssertionFailure
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-24))),
#                IntValue(0))),
#      Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                IntValue(8))))
#
        lw         $t0, -24($fp)
        li         $t1, 0
        addu       $t0,$t1
        lw         $t2, -12($fp)
        li         $t3, 8
        addu       $t2,$t3
        lw         $t2
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-24))),
#                IntValue(4))),
#      IntValue(5))
#
        lw         $t0, -24($fp)
        li         $t1, 4
        addu       $t0,$t1
        li         $t2, 5
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS", Reg("fp"), IntValue(-24))),
#                IntValue(8))),
#      IntValue(0))
#
        lw         $t0, -24($fp)
        li         $t1, 8
        addu       $t0,$t1
        li         $t2, 0
        sw         $t2, ($t0)
#
# Move(Mem(Binop("PLUS",
#                Mem(Binop("PLUS",
#                          Mem(Binop("PLUS", Reg("fp"), IntValue(-12))),
#                          IntValue(0))),
#                IntValue(8))),
#      Mem(Binop("PLUS", Reg("fp"), IntValue(-24))))
#
        lw         $t0, -12($fp)
        li         $t1, 0
        addu       $t0,$t1
        lw         $t0
        li         $t2, 8
        addu       $t0,$t2
        lw         $t3, -24($fp)
        sw         $t3, ($t0)
#
# CallP("preorder_1",
#       Reg("fp"),
#       List(Mem(Binop("PLUS", Reg("fp"), IntValue(-12)))))
#
        subu       $sp, $sp, 4
        lw         $t0, -12($fp)
        sw         $t0, 4($sp)
        move       $v0, $fp
        jal        preorder_1
        addu       $sp, $sp, 4
        move       $t0, $a0
#
# SystemCall("WRITE_STRING", StringValue("SUM: "))
#
        li         $t0, SUM: 
        move       $a0,$t0
        li         $v0,4
        syscall
#
# SystemCall("WRITE_INT",
#            Call("sum_4",
#                 Reg("fp"),
#                 List(Mem(Binop("PLUS", Reg("fp"), IntValue(-12))))))
#
        subu       $sp, $sp, 4
        lw         $t0, -12($fp)
        sw         $t0, 4($sp)
        move       $v0, $fp
        jal        sum_4
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
# CallP("preorder_1",
#       Reg("fp"),
#       List(Call("reflect_7",
#                 Reg("fp"),
#                 List(Mem(Binop("PLUS", Reg("fp"), IntValue(-12)))))))
#
        subu       $sp, $sp, 4
        subu       $sp, $sp, 4
        lw         $t0, -12($fp)
        sw         $t0, 4($sp)
        move       $v0, $fp
        jal        reflect_7
        addu       $sp, $sp, 4
        move       $t0, $a0
        sw         $t0, 4($sp)
        move       $v0, $fp
        jal        preorder_1
        addu       $sp, $sp, 4
        move       $t0, $a0
#
# SystemCall("WRITE_STRING", StringValue("SUM: "))
#
        li         $t0, SUM: 
        move       $a0,$t0
        li         $v0,4
        syscall
#
# SystemCall("WRITE_INT",
#            Call("sum_4",
#                 Reg("fp"),
#                 List(Mem(Binop("PLUS", Reg("fp"), IntValue(-12))))))
#
        subu       $sp, $sp, 4
        lw         $t0, -12($fp)
        sw         $t0, 4($sp)
        move       $v0, $fp
        jal        sum_4
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
