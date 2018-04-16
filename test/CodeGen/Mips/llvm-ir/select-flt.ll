; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=mips-unknown-linux-gnu -mcpu=mips2 -verify-machineinstrs | FileCheck %s \
; RUN:    -check-prefixes=M2
; RUN: llc < %s -mtriple=mips-unknown-linux-gnu -mcpu=mips32 -verify-machineinstrs | FileCheck %s \
; RUN:    -check-prefixes=CMOV32R1
; RUN: llc < %s -mtriple=mips-unknown-linux-gnu -mcpu=mips32r2 -verify-machineinstrs | FileCheck %s \
; RUN:    -check-prefixes=CMOV32R2
; RUN: llc < %s -mtriple=mips-unknown-linux-gnu -mcpu=mips32r3 -verify-machineinstrs | FileCheck %s \
; RUN:    -check-prefixes=CMOV32R2
; RUN: llc < %s -mtriple=mips-unknown-linux-gnu -mcpu=mips32r5 -verify-machineinstrs | FileCheck %s \
; RUN:    -check-prefixes=CMOV32R2
; RUN: llc < %s -mtriple=mips-unknown-linux-gnu -mcpu=mips32r6 -verify-machineinstrs | FileCheck %s \
; RUN:    -check-prefixes=32R6
; RUN: llc < %s -mtriple=mips64-unknown-linux-gnu -mcpu=mips3 -verify-machineinstrs | FileCheck %s \
; RUN:    -check-prefixes=M3
; RUN: llc < %s -mtriple=mips64-unknown-linux-gnu -mcpu=mips4 -verify-machineinstrs | FileCheck %s \
; RUN:    -check-prefixes=CMOV64
; RUN: llc < %s -mtriple=mips64-unknown-linux-gnu -mcpu=mips64 -verify-machineinstrs | FileCheck %s \
; RUN:    -check-prefixes=CMOV64
; RUN: llc < %s -mtriple=mips64-unknown-linux-gnu -mcpu=mips64r2 -verify-machineinstrs | FileCheck %s \
; RUN:    -check-prefixes=CMOV64
; RUN: llc < %s -mtriple=mips64-unknown-linux-gnu -mcpu=mips64r3 -verify-machineinstrs | FileCheck %s \
; RUN:    -check-prefixes=CMOV64
; RUN: llc < %s -mtriple=mips64-unknown-linux-gnu -mcpu=mips64r5 -verify-machineinstrs | FileCheck %s \
; RUN:    -check-prefixes=CMOV64
; RUN: llc < %s -mtriple=mips64-unknown-linux-gnu -mcpu=mips64r6 -verify-machineinstrs | FileCheck %s \
; RUN:    -check-prefixes=64R6
; RUN: llc < %s -mtriple=mips-unknown-linux-gnu -mcpu=mips32r3 -mattr=+micromips -verify-machineinstrs | FileCheck %s \
; RUN:    -check-prefixes=MM32R3
; RUN: llc < %s -mtriple=mips-unknown-linux-gnu -mcpu=mips32r6 -mattr=+micromips -verify-machineinstrs | FileCheck %s \
; RUN:    -check-prefixes=MM32R6

define float @tst_select_i1_float(i1 signext %s, float %x, float %y) {
; M2-LABEL: tst_select_i1_float:
; M2:       # %bb.0: # %entry
; M2-NEXT:    andi $1, $4, 1
; M2-NEXT:    bnez $1, $BB0_2
; M2-NEXT:    nop
; M2-NEXT:  # %bb.1: # %entry
; M2-NEXT:    jr $ra
; M2-NEXT:    mtc1 $6, $f0
; M2-NEXT:  $BB0_2:
; M2-NEXT:    jr $ra
; M2-NEXT:    mtc1 $5, $f0
;
; CMOV32R1-LABEL: tst_select_i1_float:
; CMOV32R1:       # %bb.0: # %entry
; CMOV32R1-NEXT:    mtc1 $6, $f0
; CMOV32R1-NEXT:    andi $1, $4, 1
; CMOV32R1-NEXT:    mtc1 $5, $f1
; CMOV32R1-NEXT:    jr $ra
; CMOV32R1-NEXT:    movn.s $f0, $f1, $1
;
; CMOV32R2-LABEL: tst_select_i1_float:
; CMOV32R2:       # %bb.0: # %entry
; CMOV32R2-NEXT:    mtc1 $6, $f0
; CMOV32R2-NEXT:    andi $1, $4, 1
; CMOV32R2-NEXT:    mtc1 $5, $f1
; CMOV32R2-NEXT:    jr $ra
; CMOV32R2-NEXT:    movn.s $f0, $f1, $1
;
; 32R6-LABEL: tst_select_i1_float:
; 32R6:       # %bb.0: # %entry
; 32R6-NEXT:    mtc1 $5, $f1
; 32R6-NEXT:    mtc1 $6, $f2
; 32R6-NEXT:    mtc1 $4, $f0
; 32R6-NEXT:    jr $ra
; 32R6-NEXT:    sel.s $f0, $f2, $f1
;
; M3-LABEL: tst_select_i1_float:
; M3:       # %bb.0: # %entry
; M3-NEXT:    andi $1, $4, 1
; M3-NEXT:    bnez $1, .LBB0_2
; M3-NEXT:    mov.s $f0, $f13
; M3-NEXT:  # %bb.1: # %entry
; M3-NEXT:    mov.s $f0, $f14
; M3-NEXT:  .LBB0_2: # %entry
; M3-NEXT:    jr $ra
; M3-NEXT:    nop
;
; CMOV64-LABEL: tst_select_i1_float:
; CMOV64:       # %bb.0: # %entry
; CMOV64-NEXT:    mov.s $f0, $f14
; CMOV64-NEXT:    andi $1, $4, 1
; CMOV64-NEXT:    jr $ra
; CMOV64-NEXT:    movn.s $f0, $f13, $1
;
; 64R6-LABEL: tst_select_i1_float:
; 64R6:       # %bb.0: # %entry
; 64R6-NEXT:    mtc1 $4, $f0
; 64R6-NEXT:    jr $ra
; 64R6-NEXT:    sel.s $f0, $f14, $f13
;
; MM32R3-LABEL: tst_select_i1_float:
; MM32R3:       # %bb.0: # %entry
; MM32R3-NEXT:    mtc1 $6, $f0
; MM32R3-NEXT:    andi16 $2, $4, 1
; MM32R3-NEXT:    mtc1 $5, $f1
; MM32R3-NEXT:    jr $ra
; MM32R3-NEXT:    movn.s $f0, $f1, $2
;
; MM32R6-LABEL: tst_select_i1_float:
; MM32R6:       # %bb.0: # %entry
; MM32R6-NEXT:    mtc1 $5, $f1
; MM32R6-NEXT:    mtc1 $6, $f2
; MM32R6-NEXT:    mtc1 $4, $f0
; MM32R6-NEXT:    sel.s $f0, $f2, $f1
; MM32R6-NEXT:    jrc $ra
entry:
  %r = select i1 %s, float %x, float %y
  ret float %r
}

define float @tst_select_i1_float_reordered(float %x, float %y,
; M2-LABEL: tst_select_i1_float_reordered:
; M2:       # %bb.0: # %entry
; M2-NEXT:    andi $1, $6, 1
; M2-NEXT:    bnez $1, $BB1_2
; M2-NEXT:    mov.s $f0, $f12
; M2-NEXT:  # %bb.1: # %entry
; M2-NEXT:    mov.s $f0, $f14
; M2-NEXT:  $BB1_2: # %entry
; M2-NEXT:    jr $ra
; M2-NEXT:    nop
;
; CMOV32R1-LABEL: tst_select_i1_float_reordered:
; CMOV32R1:       # %bb.0: # %entry
; CMOV32R1-NEXT:    mov.s $f0, $f14
; CMOV32R1-NEXT:    andi $1, $6, 1
; CMOV32R1-NEXT:    jr $ra
; CMOV32R1-NEXT:    movn.s $f0, $f12, $1
;
; CMOV32R2-LABEL: tst_select_i1_float_reordered:
; CMOV32R2:       # %bb.0: # %entry
; CMOV32R2-NEXT:    mov.s $f0, $f14
; CMOV32R2-NEXT:    andi $1, $6, 1
; CMOV32R2-NEXT:    jr $ra
; CMOV32R2-NEXT:    movn.s $f0, $f12, $1
;
; 32R6-LABEL: tst_select_i1_float_reordered:
; 32R6:       # %bb.0: # %entry
; 32R6-NEXT:    mtc1 $6, $f0
; 32R6-NEXT:    jr $ra
; 32R6-NEXT:    sel.s $f0, $f14, $f12
;
; M3-LABEL: tst_select_i1_float_reordered:
; M3:       # %bb.0: # %entry
; M3-NEXT:    andi $1, $6, 1
; M3-NEXT:    bnez $1, .LBB1_2
; M3-NEXT:    mov.s $f0, $f12
; M3-NEXT:  # %bb.1: # %entry
; M3-NEXT:    mov.s $f0, $f13
; M3-NEXT:  .LBB1_2: # %entry
; M3-NEXT:    jr $ra
; M3-NEXT:    nop
;
; CMOV64-LABEL: tst_select_i1_float_reordered:
; CMOV64:       # %bb.0: # %entry
; CMOV64-NEXT:    mov.s $f0, $f13
; CMOV64-NEXT:    andi $1, $6, 1
; CMOV64-NEXT:    jr $ra
; CMOV64-NEXT:    movn.s $f0, $f12, $1
;
; 64R6-LABEL: tst_select_i1_float_reordered:
; 64R6:       # %bb.0: # %entry
; 64R6-NEXT:    mtc1 $6, $f0
; 64R6-NEXT:    jr $ra
; 64R6-NEXT:    sel.s $f0, $f13, $f12
;
; MM32R3-LABEL: tst_select_i1_float_reordered:
; MM32R3:       # %bb.0: # %entry
; MM32R3-NEXT:    mov.s $f0, $f14
; MM32R3-NEXT:    andi16 $2, $6, 1
; MM32R3-NEXT:    jr $ra
; MM32R3-NEXT:    movn.s $f0, $f12, $2
;
; MM32R6-LABEL: tst_select_i1_float_reordered:
; MM32R6:       # %bb.0: # %entry
; MM32R6-NEXT:    mtc1 $6, $f0
; MM32R6-NEXT:    sel.s $f0, $f14, $f12
; MM32R6-NEXT:    jrc $ra
                                            i1 signext %s) {
entry:
  %r = select i1 %s, float %x, float %y
  ret float %r
}

define float @tst_select_fcmp_olt_float(float %x, float %y) {
; M2-LABEL: tst_select_fcmp_olt_float:
; M2:       # %bb.0: # %entry
; M2-NEXT:    c.olt.s $f12, $f14
; M2-NEXT:    bc1t $BB2_2
; M2-NEXT:    mov.s $f0, $f12
; M2-NEXT:  # %bb.1: # %entry
; M2-NEXT:    mov.s $f0, $f14
; M2-NEXT:  $BB2_2: # %entry
; M2-NEXT:    jr $ra
; M2-NEXT:    nop
;
; CMOV32R1-LABEL: tst_select_fcmp_olt_float:
; CMOV32R1:       # %bb.0: # %entry
; CMOV32R1-NEXT:    mov.s $f0, $f14
; CMOV32R1-NEXT:    c.olt.s $f12, $f14
; CMOV32R1-NEXT:    jr $ra
; CMOV32R1-NEXT:    movt.s $f0, $f12, $fcc0
;
; CMOV32R2-LABEL: tst_select_fcmp_olt_float:
; CMOV32R2:       # %bb.0: # %entry
; CMOV32R2-NEXT:    mov.s $f0, $f14
; CMOV32R2-NEXT:    c.olt.s $f12, $f14
; CMOV32R2-NEXT:    jr $ra
; CMOV32R2-NEXT:    movt.s $f0, $f12, $fcc0
;
; 32R6-LABEL: tst_select_fcmp_olt_float:
; 32R6:       # %bb.0: # %entry
; 32R6-NEXT:    cmp.lt.s $f0, $f12, $f14
; 32R6-NEXT:    jr $ra
; 32R6-NEXT:    sel.s $f0, $f14, $f12
;
; M3-LABEL: tst_select_fcmp_olt_float:
; M3:       # %bb.0: # %entry
; M3-NEXT:    c.olt.s $f12, $f13
; M3-NEXT:    bc1t .LBB2_2
; M3-NEXT:    mov.s $f0, $f12
; M3-NEXT:  # %bb.1: # %entry
; M3-NEXT:    mov.s $f0, $f13
; M3-NEXT:  .LBB2_2: # %entry
; M3-NEXT:    jr $ra
; M3-NEXT:    nop
;
; CMOV64-LABEL: tst_select_fcmp_olt_float:
; CMOV64:       # %bb.0: # %entry
; CMOV64-NEXT:    mov.s $f0, $f13
; CMOV64-NEXT:    c.olt.s $f12, $f13
; CMOV64-NEXT:    jr $ra
; CMOV64-NEXT:    movt.s $f0, $f12, $fcc0
;
; 64R6-LABEL: tst_select_fcmp_olt_float:
; 64R6:       # %bb.0: # %entry
; 64R6-NEXT:    cmp.lt.s $f0, $f12, $f13
; 64R6-NEXT:    jr $ra
; 64R6-NEXT:    sel.s $f0, $f13, $f12
;
; MM32R3-LABEL: tst_select_fcmp_olt_float:
; MM32R3:       # %bb.0: # %entry
; MM32R3-NEXT:    mov.s $f0, $f14
; MM32R3-NEXT:    c.olt.s $f12, $f14
; MM32R3-NEXT:    jr $ra
; MM32R3-NEXT:    movt.s $f0, $f12, $fcc0
;
; MM32R6-LABEL: tst_select_fcmp_olt_float:
; MM32R6:       # %bb.0: # %entry
; MM32R6-NEXT:    cmp.lt.s $f0, $f12, $f14
; MM32R6-NEXT:    sel.s $f0, $f14, $f12
; MM32R6-NEXT:    jrc $ra
entry:
  %s = fcmp olt float %x, %y
  %r = select i1 %s, float %x, float %y
  ret float %r
}

define float @tst_select_fcmp_ole_float(float %x, float %y) {
; M2-LABEL: tst_select_fcmp_ole_float:
; M2:       # %bb.0: # %entry
; M2-NEXT:    c.ole.s $f12, $f14
; M2-NEXT:    bc1t $BB3_2
; M2-NEXT:    mov.s $f0, $f12
; M2-NEXT:  # %bb.1: # %entry
; M2-NEXT:    mov.s $f0, $f14
; M2-NEXT:  $BB3_2: # %entry
; M2-NEXT:    jr $ra
; M2-NEXT:    nop
;
; CMOV32R1-LABEL: tst_select_fcmp_ole_float:
; CMOV32R1:       # %bb.0: # %entry
; CMOV32R1-NEXT:    mov.s $f0, $f14
; CMOV32R1-NEXT:    c.ole.s $f12, $f14
; CMOV32R1-NEXT:    jr $ra
; CMOV32R1-NEXT:    movt.s $f0, $f12, $fcc0
;
; CMOV32R2-LABEL: tst_select_fcmp_ole_float:
; CMOV32R2:       # %bb.0: # %entry
; CMOV32R2-NEXT:    mov.s $f0, $f14
; CMOV32R2-NEXT:    c.ole.s $f12, $f14
; CMOV32R2-NEXT:    jr $ra
; CMOV32R2-NEXT:    movt.s $f0, $f12, $fcc0
;
; 32R6-LABEL: tst_select_fcmp_ole_float:
; 32R6:       # %bb.0: # %entry
; 32R6-NEXT:    cmp.le.s $f0, $f12, $f14
; 32R6-NEXT:    jr $ra
; 32R6-NEXT:    sel.s $f0, $f14, $f12
;
; M3-LABEL: tst_select_fcmp_ole_float:
; M3:       # %bb.0: # %entry
; M3-NEXT:    c.ole.s $f12, $f13
; M3-NEXT:    bc1t .LBB3_2
; M3-NEXT:    mov.s $f0, $f12
; M3-NEXT:  # %bb.1: # %entry
; M3-NEXT:    mov.s $f0, $f13
; M3-NEXT:  .LBB3_2: # %entry
; M3-NEXT:    jr $ra
; M3-NEXT:    nop
;
; CMOV64-LABEL: tst_select_fcmp_ole_float:
; CMOV64:       # %bb.0: # %entry
; CMOV64-NEXT:    mov.s $f0, $f13
; CMOV64-NEXT:    c.ole.s $f12, $f13
; CMOV64-NEXT:    jr $ra
; CMOV64-NEXT:    movt.s $f0, $f12, $fcc0
;
; 64R6-LABEL: tst_select_fcmp_ole_float:
; 64R6:       # %bb.0: # %entry
; 64R6-NEXT:    cmp.le.s $f0, $f12, $f13
; 64R6-NEXT:    jr $ra
; 64R6-NEXT:    sel.s $f0, $f13, $f12
;
; MM32R3-LABEL: tst_select_fcmp_ole_float:
; MM32R3:       # %bb.0: # %entry
; MM32R3-NEXT:    mov.s $f0, $f14
; MM32R3-NEXT:    c.ole.s $f12, $f14
; MM32R3-NEXT:    jr $ra
; MM32R3-NEXT:    movt.s $f0, $f12, $fcc0
;
; MM32R6-LABEL: tst_select_fcmp_ole_float:
; MM32R6:       # %bb.0: # %entry
; MM32R6-NEXT:    cmp.le.s $f0, $f12, $f14
; MM32R6-NEXT:    sel.s $f0, $f14, $f12
; MM32R6-NEXT:    jrc $ra
entry:
  %s = fcmp ole float %x, %y
  %r = select i1 %s, float %x, float %y
  ret float %r
}

define float @tst_select_fcmp_ogt_float(float %x, float %y) {
; M2-LABEL: tst_select_fcmp_ogt_float:
; M2:       # %bb.0: # %entry
; M2-NEXT:    c.ule.s $f12, $f14
; M2-NEXT:    bc1f $BB4_2
; M2-NEXT:    mov.s $f0, $f12
; M2-NEXT:  # %bb.1: # %entry
; M2-NEXT:    mov.s $f0, $f14
; M2-NEXT:  $BB4_2: # %entry
; M2-NEXT:    jr $ra
; M2-NEXT:    nop
;
; CMOV32R1-LABEL: tst_select_fcmp_ogt_float:
; CMOV32R1:       # %bb.0: # %entry
; CMOV32R1-NEXT:    mov.s $f0, $f14
; CMOV32R1-NEXT:    c.ule.s $f12, $f14
; CMOV32R1-NEXT:    jr $ra
; CMOV32R1-NEXT:    movf.s $f0, $f12, $fcc0
;
; CMOV32R2-LABEL: tst_select_fcmp_ogt_float:
; CMOV32R2:       # %bb.0: # %entry
; CMOV32R2-NEXT:    mov.s $f0, $f14
; CMOV32R2-NEXT:    c.ule.s $f12, $f14
; CMOV32R2-NEXT:    jr $ra
; CMOV32R2-NEXT:    movf.s $f0, $f12, $fcc0
;
; 32R6-LABEL: tst_select_fcmp_ogt_float:
; 32R6:       # %bb.0: # %entry
; 32R6-NEXT:    cmp.lt.s $f0, $f14, $f12
; 32R6-NEXT:    jr $ra
; 32R6-NEXT:    sel.s $f0, $f14, $f12
;
; M3-LABEL: tst_select_fcmp_ogt_float:
; M3:       # %bb.0: # %entry
; M3-NEXT:    c.ule.s $f12, $f13
; M3-NEXT:    bc1f .LBB4_2
; M3-NEXT:    mov.s $f0, $f12
; M3-NEXT:  # %bb.1: # %entry
; M3-NEXT:    mov.s $f0, $f13
; M3-NEXT:  .LBB4_2: # %entry
; M3-NEXT:    jr $ra
; M3-NEXT:    nop
;
; CMOV64-LABEL: tst_select_fcmp_ogt_float:
; CMOV64:       # %bb.0: # %entry
; CMOV64-NEXT:    mov.s $f0, $f13
; CMOV64-NEXT:    c.ule.s $f12, $f13
; CMOV64-NEXT:    jr $ra
; CMOV64-NEXT:    movf.s $f0, $f12, $fcc0
;
; 64R6-LABEL: tst_select_fcmp_ogt_float:
; 64R6:       # %bb.0: # %entry
; 64R6-NEXT:    cmp.lt.s $f0, $f13, $f12
; 64R6-NEXT:    jr $ra
; 64R6-NEXT:    sel.s $f0, $f13, $f12
;
; MM32R3-LABEL: tst_select_fcmp_ogt_float:
; MM32R3:       # %bb.0: # %entry
; MM32R3-NEXT:    mov.s $f0, $f14
; MM32R3-NEXT:    c.ule.s $f12, $f14
; MM32R3-NEXT:    jr $ra
; MM32R3-NEXT:    movf.s $f0, $f12, $fcc0
;
; MM32R6-LABEL: tst_select_fcmp_ogt_float:
; MM32R6:       # %bb.0: # %entry
; MM32R6-NEXT:    cmp.lt.s $f0, $f14, $f12
; MM32R6-NEXT:    sel.s $f0, $f14, $f12
; MM32R6-NEXT:    jrc $ra
entry:
  %s = fcmp ogt float %x, %y
  %r = select i1 %s, float %x, float %y
  ret float %r
}

define float @tst_select_fcmp_oge_float(float %x, float %y) {
; M2-LABEL: tst_select_fcmp_oge_float:
; M2:       # %bb.0: # %entry
; M2-NEXT:    c.ult.s $f12, $f14
; M2-NEXT:    bc1f $BB5_2
; M2-NEXT:    mov.s $f0, $f12
; M2-NEXT:  # %bb.1: # %entry
; M2-NEXT:    mov.s $f0, $f14
; M2-NEXT:  $BB5_2: # %entry
; M2-NEXT:    jr $ra
; M2-NEXT:    nop
;
; CMOV32R1-LABEL: tst_select_fcmp_oge_float:
; CMOV32R1:       # %bb.0: # %entry
; CMOV32R1-NEXT:    mov.s $f0, $f14
; CMOV32R1-NEXT:    c.ult.s $f12, $f14
; CMOV32R1-NEXT:    jr $ra
; CMOV32R1-NEXT:    movf.s $f0, $f12, $fcc0
;
; CMOV32R2-LABEL: tst_select_fcmp_oge_float:
; CMOV32R2:       # %bb.0: # %entry
; CMOV32R2-NEXT:    mov.s $f0, $f14
; CMOV32R2-NEXT:    c.ult.s $f12, $f14
; CMOV32R2-NEXT:    jr $ra
; CMOV32R2-NEXT:    movf.s $f0, $f12, $fcc0
;
; 32R6-LABEL: tst_select_fcmp_oge_float:
; 32R6:       # %bb.0: # %entry
; 32R6-NEXT:    cmp.le.s $f0, $f14, $f12
; 32R6-NEXT:    jr $ra
; 32R6-NEXT:    sel.s $f0, $f14, $f12
;
; M3-LABEL: tst_select_fcmp_oge_float:
; M3:       # %bb.0: # %entry
; M3-NEXT:    c.ult.s $f12, $f13
; M3-NEXT:    bc1f .LBB5_2
; M3-NEXT:    mov.s $f0, $f12
; M3-NEXT:  # %bb.1: # %entry
; M3-NEXT:    mov.s $f0, $f13
; M3-NEXT:  .LBB5_2: # %entry
; M3-NEXT:    jr $ra
; M3-NEXT:    nop
;
; CMOV64-LABEL: tst_select_fcmp_oge_float:
; CMOV64:       # %bb.0: # %entry
; CMOV64-NEXT:    mov.s $f0, $f13
; CMOV64-NEXT:    c.ult.s $f12, $f13
; CMOV64-NEXT:    jr $ra
; CMOV64-NEXT:    movf.s $f0, $f12, $fcc0
;
; 64R6-LABEL: tst_select_fcmp_oge_float:
; 64R6:       # %bb.0: # %entry
; 64R6-NEXT:    cmp.le.s $f0, $f13, $f12
; 64R6-NEXT:    jr $ra
; 64R6-NEXT:    sel.s $f0, $f13, $f12
;
; MM32R3-LABEL: tst_select_fcmp_oge_float:
; MM32R3:       # %bb.0: # %entry
; MM32R3-NEXT:    mov.s $f0, $f14
; MM32R3-NEXT:    c.ult.s $f12, $f14
; MM32R3-NEXT:    jr $ra
; MM32R3-NEXT:    movf.s $f0, $f12, $fcc0
;
; MM32R6-LABEL: tst_select_fcmp_oge_float:
; MM32R6:       # %bb.0: # %entry
; MM32R6-NEXT:    cmp.le.s $f0, $f14, $f12
; MM32R6-NEXT:    sel.s $f0, $f14, $f12
; MM32R6-NEXT:    jrc $ra
entry:
  %s = fcmp oge float %x, %y
  %r = select i1 %s, float %x, float %y
  ret float %r
}

define float @tst_select_fcmp_oeq_float(float %x, float %y) {
; M2-LABEL: tst_select_fcmp_oeq_float:
; M2:       # %bb.0: # %entry
; M2-NEXT:    c.eq.s $f12, $f14
; M2-NEXT:    bc1t $BB6_2
; M2-NEXT:    mov.s $f0, $f12
; M2-NEXT:  # %bb.1: # %entry
; M2-NEXT:    mov.s $f0, $f14
; M2-NEXT:  $BB6_2: # %entry
; M2-NEXT:    jr $ra
; M2-NEXT:    nop
;
; CMOV32R1-LABEL: tst_select_fcmp_oeq_float:
; CMOV32R1:       # %bb.0: # %entry
; CMOV32R1-NEXT:    mov.s $f0, $f14
; CMOV32R1-NEXT:    c.eq.s $f12, $f14
; CMOV32R1-NEXT:    jr $ra
; CMOV32R1-NEXT:    movt.s $f0, $f12, $fcc0
;
; CMOV32R2-LABEL: tst_select_fcmp_oeq_float:
; CMOV32R2:       # %bb.0: # %entry
; CMOV32R2-NEXT:    mov.s $f0, $f14
; CMOV32R2-NEXT:    c.eq.s $f12, $f14
; CMOV32R2-NEXT:    jr $ra
; CMOV32R2-NEXT:    movt.s $f0, $f12, $fcc0
;
; 32R6-LABEL: tst_select_fcmp_oeq_float:
; 32R6:       # %bb.0: # %entry
; 32R6-NEXT:    cmp.eq.s $f0, $f12, $f14
; 32R6-NEXT:    jr $ra
; 32R6-NEXT:    sel.s $f0, $f14, $f12
;
; M3-LABEL: tst_select_fcmp_oeq_float:
; M3:       # %bb.0: # %entry
; M3-NEXT:    c.eq.s $f12, $f13
; M3-NEXT:    bc1t .LBB6_2
; M3-NEXT:    mov.s $f0, $f12
; M3-NEXT:  # %bb.1: # %entry
; M3-NEXT:    mov.s $f0, $f13
; M3-NEXT:  .LBB6_2: # %entry
; M3-NEXT:    jr $ra
; M3-NEXT:    nop
;
; CMOV64-LABEL: tst_select_fcmp_oeq_float:
; CMOV64:       # %bb.0: # %entry
; CMOV64-NEXT:    mov.s $f0, $f13
; CMOV64-NEXT:    c.eq.s $f12, $f13
; CMOV64-NEXT:    jr $ra
; CMOV64-NEXT:    movt.s $f0, $f12, $fcc0
;
; 64R6-LABEL: tst_select_fcmp_oeq_float:
; 64R6:       # %bb.0: # %entry
; 64R6-NEXT:    cmp.eq.s $f0, $f12, $f13
; 64R6-NEXT:    jr $ra
; 64R6-NEXT:    sel.s $f0, $f13, $f12
;
; MM32R3-LABEL: tst_select_fcmp_oeq_float:
; MM32R3:       # %bb.0: # %entry
; MM32R3-NEXT:    mov.s $f0, $f14
; MM32R3-NEXT:    c.eq.s $f12, $f14
; MM32R3-NEXT:    jr $ra
; MM32R3-NEXT:    movt.s $f0, $f12, $fcc0
;
; MM32R6-LABEL: tst_select_fcmp_oeq_float:
; MM32R6:       # %bb.0: # %entry
; MM32R6-NEXT:    cmp.eq.s $f0, $f12, $f14
; MM32R6-NEXT:    sel.s $f0, $f14, $f12
; MM32R6-NEXT:    jrc $ra
entry:
  %s = fcmp oeq float %x, %y
  %r = select i1 %s, float %x, float %y
  ret float %r
}

define float @tst_select_fcmp_one_float(float %x, float %y) {
; M2-LABEL: tst_select_fcmp_one_float:
; M2:       # %bb.0: # %entry
; M2-NEXT:    c.ueq.s $f12, $f14
; M2-NEXT:    bc1f $BB7_2
; M2-NEXT:    mov.s $f0, $f12
; M2-NEXT:  # %bb.1: # %entry
; M2-NEXT:    mov.s $f0, $f14
; M2-NEXT:  $BB7_2: # %entry
; M2-NEXT:    jr $ra
; M2-NEXT:    nop
;
; CMOV32R1-LABEL: tst_select_fcmp_one_float:
; CMOV32R1:       # %bb.0: # %entry
; CMOV32R1-NEXT:    mov.s $f0, $f14
; CMOV32R1-NEXT:    c.ueq.s $f12, $f14
; CMOV32R1-NEXT:    jr $ra
; CMOV32R1-NEXT:    movf.s $f0, $f12, $fcc0
;
; CMOV32R2-LABEL: tst_select_fcmp_one_float:
; CMOV32R2:       # %bb.0: # %entry
; CMOV32R2-NEXT:    mov.s $f0, $f14
; CMOV32R2-NEXT:    c.ueq.s $f12, $f14
; CMOV32R2-NEXT:    jr $ra
; CMOV32R2-NEXT:    movf.s $f0, $f12, $fcc0
;
; 32R6-LABEL: tst_select_fcmp_one_float:
; 32R6:       # %bb.0: # %entry
; 32R6-NEXT:    cmp.ueq.s $f0, $f12, $f14
; 32R6-NEXT:    mfc1 $1, $f0
; 32R6-NEXT:    not $1, $1
; 32R6-NEXT:    mtc1 $1, $f0
; 32R6-NEXT:    jr $ra
; 32R6-NEXT:    sel.s $f0, $f14, $f12
;
; M3-LABEL: tst_select_fcmp_one_float:
; M3:       # %bb.0: # %entry
; M3-NEXT:    c.ueq.s $f12, $f13
; M3-NEXT:    bc1f .LBB7_2
; M3-NEXT:    mov.s $f0, $f12
; M3-NEXT:  # %bb.1: # %entry
; M3-NEXT:    mov.s $f0, $f13
; M3-NEXT:  .LBB7_2: # %entry
; M3-NEXT:    jr $ra
; M3-NEXT:    nop
;
; CMOV64-LABEL: tst_select_fcmp_one_float:
; CMOV64:       # %bb.0: # %entry
; CMOV64-NEXT:    mov.s $f0, $f13
; CMOV64-NEXT:    c.ueq.s $f12, $f13
; CMOV64-NEXT:    jr $ra
; CMOV64-NEXT:    movf.s $f0, $f12, $fcc0
;
; 64R6-LABEL: tst_select_fcmp_one_float:
; 64R6:       # %bb.0: # %entry
; 64R6-NEXT:    cmp.ueq.s $f0, $f12, $f13
; 64R6-NEXT:    mfc1 $1, $f0
; 64R6-NEXT:    not $1, $1
; 64R6-NEXT:    mtc1 $1, $f0
; 64R6-NEXT:    jr $ra
; 64R6-NEXT:    sel.s $f0, $f13, $f12
;
; MM32R3-LABEL: tst_select_fcmp_one_float:
; MM32R3:       # %bb.0: # %entry
; MM32R3-NEXT:    mov.s $f0, $f14
; MM32R3-NEXT:    c.ueq.s $f12, $f14
; MM32R3-NEXT:    jr $ra
; MM32R3-NEXT:    movf.s $f0, $f12, $fcc0
;
; MM32R6-LABEL: tst_select_fcmp_one_float:
; MM32R6:       # %bb.0: # %entry
; MM32R6-NEXT:    cmp.ueq.s $f0, $f12, $f14
; MM32R6-NEXT:    mfc1 $1, $f0
; MM32R6-NEXT:    not $1, $1
; MM32R6-NEXT:    mtc1 $1, $f0
; MM32R6-NEXT:    sel.s $f0, $f14, $f12
; MM32R6-NEXT:    jrc $ra
entry:
  %s = fcmp one float %x, %y
  %r = select i1 %s, float %x, float %y
  ret float %r
}