; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=mipsel-mti-linux-gnu < %s | FileCheck %s -check-prefix=MIPS32
; RUN: llc -mtriple=mips64el-mti-linux-gnu < %s | FileCheck %s -check-prefix=MIPS64


define i32 @mul5_32(i32 signext %a) {
; MIPS32-LABEL: mul5_32:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    sll $1, $4, 2
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    addu $2, $1, $4
;
; MIPS64-LABEL: mul5_32:
; MIPS64:       # %bb.0: # %entry
; MIPS64-NEXT:    sll $1, $4, 2
; MIPS64-NEXT:    jr $ra
; MIPS64-NEXT:    addu $2, $1, $4
entry:
  %mul = mul nsw i32 %a, 5
  ret i32 %mul
}

define i32 @mul27_32(i32 signext %a) {
; MIPS32-LABEL: mul27_32:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    sll $1, $4, 2
; MIPS32-NEXT:    addu $1, $1, $4
; MIPS32-NEXT:    sll $2, $4, 5
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    subu $2, $2, $1
;
; MIPS64-LABEL: mul27_32:
; MIPS64:       # %bb.0: # %entry
; MIPS64-NEXT:    sll $1, $4, 2
; MIPS64-NEXT:    addu $1, $1, $4
; MIPS64-NEXT:    sll $2, $4, 5
; MIPS64-NEXT:    jr $ra
; MIPS64-NEXT:    subu $2, $2, $1
entry:
  %mul = mul nsw i32 %a, 27
  ret i32 %mul
}

define i32 @muln2147483643_32(i32 signext %a) {
; MIPS32-LABEL: muln2147483643_32:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    sll $1, $4, 2
; MIPS32-NEXT:    addu $1, $1, $4
; MIPS32-NEXT:    sll $2, $4, 31
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    addu $2, $2, $1
;
; MIPS64-LABEL: muln2147483643_32:
; MIPS64:       # %bb.0: # %entry
; MIPS64-NEXT:    sll $1, $4, 2
; MIPS64-NEXT:    addu $1, $1, $4
; MIPS64-NEXT:    sll $2, $4, 31
; MIPS64-NEXT:    jr $ra
; MIPS64-NEXT:    addu $2, $2, $1
entry:
  %mul = mul nsw i32 %a, -2147483643
  ret i32 %mul
}

define i64 @muln9223372036854775805_64(i64 signext %a) {
; MIPS32-LABEL: muln9223372036854775805_64:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    sll $1, $4, 1
; MIPS32-NEXT:    addu $2, $1, $4
; MIPS32-NEXT:    sltu $1, $2, $1
; MIPS32-NEXT:    srl $3, $4, 31
; MIPS32-NEXT:    sll $6, $5, 1
; MIPS32-NEXT:    or $3, $6, $3
; MIPS32-NEXT:    addu $3, $3, $5
; MIPS32-NEXT:    addu $1, $3, $1
; MIPS32-NEXT:    sll $3, $4, 31
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    addu $3, $3, $1
;
; MIPS64-LABEL: muln9223372036854775805_64:
; MIPS64:       # %bb.0: # %entry
; MIPS64-NEXT:    dsll $1, $4, 1
; MIPS64-NEXT:    daddu $1, $1, $4
; MIPS64-NEXT:    dsll $2, $4, 63
; MIPS64-NEXT:    jr $ra
; MIPS64-NEXT:    daddu $2, $2, $1
entry:
  %mul = mul nsw i64 %a, -9223372036854775805
  ret i64 %mul
}

define i128 @muln170141183460469231731687303715884105725_128(i128 signext %a) {
; MIPS32-LABEL: muln170141183460469231731687303715884105725_128:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    sll $1, $4, 1
; MIPS32-NEXT:    addu $2, $1, $4
; MIPS32-NEXT:    sltu $1, $2, $1
; MIPS32-NEXT:    srl $3, $4, 31
; MIPS32-NEXT:    sll $8, $5, 1
; MIPS32-NEXT:    or $8, $8, $3
; MIPS32-NEXT:    addu $3, $8, $5
; MIPS32-NEXT:    addu $3, $3, $1
; MIPS32-NEXT:    sltu $9, $3, $8
; MIPS32-NEXT:    xor $8, $3, $8
; MIPS32-NEXT:    movz $9, $1, $8
; MIPS32-NEXT:    srl $1, $5, 31
; MIPS32-NEXT:    sll $5, $6, 1
; MIPS32-NEXT:    or $5, $5, $1
; MIPS32-NEXT:    addu $8, $5, $6
; MIPS32-NEXT:    addu $1, $8, $9
; MIPS32-NEXT:    sltu $5, $8, $5
; MIPS32-NEXT:    srl $6, $6, 31
; MIPS32-NEXT:    sll $9, $7, 1
; MIPS32-NEXT:    or $6, $9, $6
; MIPS32-NEXT:    addu $6, $6, $7
; MIPS32-NEXT:    addu $5, $6, $5
; MIPS32-NEXT:    sll $4, $4, 31
; MIPS32-NEXT:    sltu $6, $1, $8
; MIPS32-NEXT:    addu $5, $5, $6
; MIPS32-NEXT:    addu $5, $4, $5
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    move $4, $1
;
; MIPS64-LABEL: muln170141183460469231731687303715884105725_128:
; MIPS64:       # %bb.0: # %entry
; MIPS64-NEXT:    dsrl $1, $4, 63
; MIPS64-NEXT:    dsll $2, $5, 1
; MIPS64-NEXT:    or $1, $2, $1
; MIPS64-NEXT:    daddu $1, $1, $5
; MIPS64-NEXT:    dsll $3, $4, 1
; MIPS64-NEXT:    daddu $2, $3, $4
; MIPS64-NEXT:    sltu $3, $2, $3
; MIPS64-NEXT:    dsll $3, $3, 32
; MIPS64-NEXT:    dsrl $3, $3, 32
; MIPS64-NEXT:    daddu $1, $1, $3
; MIPS64-NEXT:    dsll $3, $4, 63
; MIPS64-NEXT:    jr $ra
; MIPS64-NEXT:    daddu $3, $3, $1
entry:
  %mul = mul nsw i128 %a, -170141183460469231731687303715884105725
  ret i128 %mul
}

define i128 @mul170141183460469231731687303715884105723_128(i128 signext %a) {
; MIPS32-LABEL: mul170141183460469231731687303715884105723_128:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    sll $1, $4, 2
; MIPS32-NEXT:    addu $2, $1, $4
; MIPS32-NEXT:    sltu $1, $2, $1
; MIPS32-NEXT:    srl $3, $4, 30
; MIPS32-NEXT:    sll $8, $5, 2
; MIPS32-NEXT:    or $3, $8, $3
; MIPS32-NEXT:    addu $8, $3, $5
; MIPS32-NEXT:    addu $8, $8, $1
; MIPS32-NEXT:    sltu $9, $8, $3
; MIPS32-NEXT:    xor $3, $8, $3
; MIPS32-NEXT:    sltu $10, $zero, $8
; MIPS32-NEXT:    sltu $11, $zero, $2
; MIPS32-NEXT:    movz $10, $11, $8
; MIPS32-NEXT:    movz $9, $1, $3
; MIPS32-NEXT:    srl $1, $5, 30
; MIPS32-NEXT:    sll $3, $6, 2
; MIPS32-NEXT:    or $1, $3, $1
; MIPS32-NEXT:    addu $3, $1, $6
; MIPS32-NEXT:    addu $5, $3, $9
; MIPS32-NEXT:    sll $4, $4, 31
; MIPS32-NEXT:    negu $9, $5
; MIPS32-NEXT:    sltu $12, $9, $10
; MIPS32-NEXT:    sltu $13, $5, $3
; MIPS32-NEXT:    sltu $1, $3, $1
; MIPS32-NEXT:    srl $3, $6, 30
; MIPS32-NEXT:    sll $6, $7, 2
; MIPS32-NEXT:    or $3, $6, $3
; MIPS32-NEXT:    addu $3, $3, $7
; MIPS32-NEXT:    addu $1, $3, $1
; MIPS32-NEXT:    addu $1, $1, $13
; MIPS32-NEXT:    subu $1, $4, $1
; MIPS32-NEXT:    sltu $3, $zero, $5
; MIPS32-NEXT:    subu $1, $1, $3
; MIPS32-NEXT:    subu $5, $1, $12
; MIPS32-NEXT:    subu $4, $9, $10
; MIPS32-NEXT:    negu $1, $8
; MIPS32-NEXT:    subu $3, $1, $11
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    negu $2, $2
;
; MIPS64-LABEL: mul170141183460469231731687303715884105723_128:
; MIPS64:       # %bb.0: # %entry
; MIPS64-NEXT:    dsrl $1, $4, 62
; MIPS64-NEXT:    dsll $2, $5, 2
; MIPS64-NEXT:    or $1, $2, $1
; MIPS64-NEXT:    daddu $1, $1, $5
; MIPS64-NEXT:    dsll $2, $4, 2
; MIPS64-NEXT:    daddu $5, $2, $4
; MIPS64-NEXT:    sltu $2, $5, $2
; MIPS64-NEXT:    dsll $2, $2, 32
; MIPS64-NEXT:    dsrl $2, $2, 32
; MIPS64-NEXT:    daddu $1, $1, $2
; MIPS64-NEXT:    dsll $2, $4, 63
; MIPS64-NEXT:    dsubu $1, $2, $1
; MIPS64-NEXT:    sltu $2, $zero, $5
; MIPS64-NEXT:    dsll $2, $2, 32
; MIPS64-NEXT:    dsrl $2, $2, 32
; MIPS64-NEXT:    dsubu $3, $1, $2
; MIPS64-NEXT:    jr $ra
; MIPS64-NEXT:    dnegu $2, $5
entry:
  %mul = mul nsw i128 %a, 170141183460469231731687303715884105723
  ret i128 %mul
}

define i32 @mul42949673_32(i32 %a) {
; MIPS32-LABEL: mul42949673_32:
; MIPS32:       # %bb.0:
; MIPS32-NEXT:    sll $1, $4, 3
; MIPS32-NEXT:    addu $1, $1, $4
; MIPS32-NEXT:    sll $2, $4, 5
; MIPS32-NEXT:    addu $1, $2, $1
; MIPS32-NEXT:    sll $2, $4, 10
; MIPS32-NEXT:    subu $1, $2, $1
; MIPS32-NEXT:    sll $2, $4, 13
; MIPS32-NEXT:    addu $1, $2, $1
; MIPS32-NEXT:    sll $2, $4, 15
; MIPS32-NEXT:    addu $1, $2, $1
; MIPS32-NEXT:    sll $2, $4, 20
; MIPS32-NEXT:    subu $1, $2, $1
; MIPS32-NEXT:    sll $2, $4, 25
; MIPS32-NEXT:    sll $3, $4, 23
; MIPS32-NEXT:    addu $1, $3, $1
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    addu $2, $2, $1
;
; MIPS64-LABEL: mul42949673_32:
; MIPS64:       # %bb.0:
; MIPS64-NEXT:    sll $1, $4, 0
; MIPS64-NEXT:    sll $2, $1, 3
; MIPS64-NEXT:    addu $2, $2, $1
; MIPS64-NEXT:    sll $3, $1, 5
; MIPS64-NEXT:    addu $2, $3, $2
; MIPS64-NEXT:    sll $3, $1, 10
; MIPS64-NEXT:    subu $2, $3, $2
; MIPS64-NEXT:    sll $3, $1, 13
; MIPS64-NEXT:    addu $2, $3, $2
; MIPS64-NEXT:    sll $3, $1, 15
; MIPS64-NEXT:    addu $2, $3, $2
; MIPS64-NEXT:    sll $3, $1, 20
; MIPS64-NEXT:    subu $2, $3, $2
; MIPS64-NEXT:    sll $3, $1, 25
; MIPS64-NEXT:    sll $1, $1, 23
; MIPS64-NEXT:    addu $1, $1, $2
; MIPS64-NEXT:    jr $ra
; MIPS64-NEXT:    addu $2, $3, $1
  %b = mul i32 %a, 42949673
  ret i32 %b
}

define i64 @mul42949673_64(i64 %a) {
; MIPS32-LABEL: mul42949673_64:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    addiu $sp, $sp, -8
; MIPS32-NEXT:    .cfi_def_cfa_offset 8
; MIPS32-NEXT:    sw $16, 4($sp) # 4-byte Folded Spill
; MIPS32-NEXT:    .cfi_offset 16, -4
; MIPS32-NEXT:    sll $1, $4, 3
; MIPS32-NEXT:    addu $2, $1, $4
; MIPS32-NEXT:    sltu $1, $2, $1
; MIPS32-NEXT:    srl $3, $4, 29
; MIPS32-NEXT:    sll $6, $5, 3
; MIPS32-NEXT:    or $3, $6, $3
; MIPS32-NEXT:    addu $3, $3, $5
; MIPS32-NEXT:    addu $1, $3, $1
; MIPS32-NEXT:    srl $3, $4, 27
; MIPS32-NEXT:    sll $6, $5, 5
; MIPS32-NEXT:    or $3, $6, $3
; MIPS32-NEXT:    addu $1, $3, $1
; MIPS32-NEXT:    sll $3, $4, 5
; MIPS32-NEXT:    addu $2, $3, $2
; MIPS32-NEXT:    sll $6, $4, 10
; MIPS32-NEXT:    subu $7, $6, $2
; MIPS32-NEXT:    sltu $3, $2, $3
; MIPS32-NEXT:    sll $8, $4, 13
; MIPS32-NEXT:    addu $1, $1, $3
; MIPS32-NEXT:    addu $3, $8, $7
; MIPS32-NEXT:    sll $7, $4, 15
; MIPS32-NEXT:    addu $9, $7, $3
; MIPS32-NEXT:    srl $10, $4, 22
; MIPS32-NEXT:    sll $11, $5, 10
; MIPS32-NEXT:    or $10, $11, $10
; MIPS32-NEXT:    sll $11, $4, 20
; MIPS32-NEXT:    subu $1, $10, $1
; MIPS32-NEXT:    subu $10, $11, $9
; MIPS32-NEXT:    sltu $2, $6, $2
; MIPS32-NEXT:    srl $6, $4, 17
; MIPS32-NEXT:    sll $12, $5, 15
; MIPS32-NEXT:    srl $13, $4, 12
; MIPS32-NEXT:    sll $14, $5, 20
; MIPS32-NEXT:    srl $15, $4, 9
; MIPS32-NEXT:    sll $24, $5, 23
; MIPS32-NEXT:    sll $25, $4, 23
; MIPS32-NEXT:    srl $gp, $4, 7
; MIPS32-NEXT:    sll $16, $5, 25
; MIPS32-NEXT:    or $gp, $16, $gp
; MIPS32-NEXT:    sll $16, $4, 25
; MIPS32-NEXT:    subu $1, $1, $2
; MIPS32-NEXT:    addu $10, $25, $10
; MIPS32-NEXT:    or $2, $24, $15
; MIPS32-NEXT:    or $13, $14, $13
; MIPS32-NEXT:    or $6, $12, $6
; MIPS32-NEXT:    srl $4, $4, 19
; MIPS32-NEXT:    sll $5, $5, 13
; MIPS32-NEXT:    or $4, $5, $4
; MIPS32-NEXT:    addu $1, $4, $1
; MIPS32-NEXT:    sltu $3, $3, $8
; MIPS32-NEXT:    addu $1, $1, $3
; MIPS32-NEXT:    addu $1, $6, $1
; MIPS32-NEXT:    sltu $3, $9, $7
; MIPS32-NEXT:    addu $1, $1, $3
; MIPS32-NEXT:    subu $1, $13, $1
; MIPS32-NEXT:    sltu $3, $11, $9
; MIPS32-NEXT:    subu $1, $1, $3
; MIPS32-NEXT:    addu $1, $2, $1
; MIPS32-NEXT:    addu $2, $16, $10
; MIPS32-NEXT:    sltu $3, $10, $25
; MIPS32-NEXT:    addu $1, $1, $3
; MIPS32-NEXT:    sltu $3, $2, $16
; MIPS32-NEXT:    addu $1, $gp, $1
; MIPS32-NEXT:    addu $3, $1, $3
; MIPS32-NEXT:    lw $16, 4($sp) # 4-byte Folded Reload
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    addiu $sp, $sp, 8
;
; MIPS64-LABEL: mul42949673_64:
; MIPS64:       # %bb.0: # %entry
; MIPS64-NEXT:    dsll $1, $4, 3
; MIPS64-NEXT:    daddu $1, $1, $4
; MIPS64-NEXT:    dsll $2, $4, 5
; MIPS64-NEXT:    daddu $1, $2, $1
; MIPS64-NEXT:    dsll $2, $4, 10
; MIPS64-NEXT:    dsubu $1, $2, $1
; MIPS64-NEXT:    dsll $2, $4, 13
; MIPS64-NEXT:    daddu $1, $2, $1
; MIPS64-NEXT:    dsll $2, $4, 15
; MIPS64-NEXT:    daddu $1, $2, $1
; MIPS64-NEXT:    dsll $2, $4, 20
; MIPS64-NEXT:    dsubu $1, $2, $1
; MIPS64-NEXT:    dsll $2, $4, 25
; MIPS64-NEXT:    dsll $3, $4, 23
; MIPS64-NEXT:    daddu $1, $3, $1
; MIPS64-NEXT:    jr $ra
; MIPS64-NEXT:    daddu $2, $2, $1
entry:
  %b = mul i64 %a, 42949673
  ret i64 %b
}

define i32 @mul22224078_32(i32 %a) {
; MIPS32-LABEL: mul22224078_32:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    sll $1, $4, 1
; MIPS32-NEXT:    sll $2, $4, 4
; MIPS32-NEXT:    subu $1, $2, $1
; MIPS32-NEXT:    sll $2, $4, 6
; MIPS32-NEXT:    subu $1, $2, $1
; MIPS32-NEXT:    sll $2, $4, 8
; MIPS32-NEXT:    subu $1, $2, $1
; MIPS32-NEXT:    sll $2, $4, 10
; MIPS32-NEXT:    subu $1, $2, $1
; MIPS32-NEXT:    sll $2, $4, 13
; MIPS32-NEXT:    subu $1, $2, $1
; MIPS32-NEXT:    sll $2, $4, 16
; MIPS32-NEXT:    subu $1, $2, $1
; MIPS32-NEXT:    sll $2, $4, 24
; MIPS32-NEXT:    sll $3, $4, 22
; MIPS32-NEXT:    sll $5, $4, 20
; MIPS32-NEXT:    sll $4, $4, 18
; MIPS32-NEXT:    subu $1, $4, $1
; MIPS32-NEXT:    addu $1, $5, $1
; MIPS32-NEXT:    addu $1, $3, $1
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    addu $2, $2, $1
;
; MIPS64-LABEL: mul22224078_32:
; MIPS64:       # %bb.0: # %entry
; MIPS64-NEXT:    sll $1, $4, 0
; MIPS64-NEXT:    sll $2, $1, 1
; MIPS64-NEXT:    sll $3, $1, 4
; MIPS64-NEXT:    subu $2, $3, $2
; MIPS64-NEXT:    sll $3, $1, 6
; MIPS64-NEXT:    subu $2, $3, $2
; MIPS64-NEXT:    sll $3, $1, 8
; MIPS64-NEXT:    subu $2, $3, $2
; MIPS64-NEXT:    sll $3, $1, 10
; MIPS64-NEXT:    subu $2, $3, $2
; MIPS64-NEXT:    sll $3, $1, 13
; MIPS64-NEXT:    subu $2, $3, $2
; MIPS64-NEXT:    sll $3, $1, 16
; MIPS64-NEXT:    subu $2, $3, $2
; MIPS64-NEXT:    sll $3, $1, 24
; MIPS64-NEXT:    sll $4, $1, 22
; MIPS64-NEXT:    sll $5, $1, 20
; MIPS64-NEXT:    sll $1, $1, 18
; MIPS64-NEXT:    subu $1, $1, $2
; MIPS64-NEXT:    addu $1, $5, $1
; MIPS64-NEXT:    addu $1, $4, $1
; MIPS64-NEXT:    jr $ra
; MIPS64-NEXT:    addu $2, $3, $1
entry:
  %b = mul i32 %a, 22224078
  ret i32 %b
}

define i64 @mul22224078_64(i64 %a) {
; MIPS32-LABEL: mul22224078_64:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    addiu $sp, $sp, -32
; MIPS32-NEXT:    .cfi_def_cfa_offset 32
; MIPS32-NEXT:    sw $22, 28($sp) # 4-byte Folded Spill
; MIPS32-NEXT:    sw $21, 24($sp) # 4-byte Folded Spill
; MIPS32-NEXT:    sw $20, 20($sp) # 4-byte Folded Spill
; MIPS32-NEXT:    sw $19, 16($sp) # 4-byte Folded Spill
; MIPS32-NEXT:    sw $18, 12($sp) # 4-byte Folded Spill
; MIPS32-NEXT:    sw $17, 8($sp) # 4-byte Folded Spill
; MIPS32-NEXT:    sw $16, 4($sp) # 4-byte Folded Spill
; MIPS32-NEXT:    .cfi_offset 22, -4
; MIPS32-NEXT:    .cfi_offset 21, -8
; MIPS32-NEXT:    .cfi_offset 20, -12
; MIPS32-NEXT:    .cfi_offset 19, -16
; MIPS32-NEXT:    .cfi_offset 18, -20
; MIPS32-NEXT:    .cfi_offset 17, -24
; MIPS32-NEXT:    .cfi_offset 16, -28
; MIPS32-NEXT:    srl $1, $4, 31
; MIPS32-NEXT:    sll $2, $5, 1
; MIPS32-NEXT:    or $1, $2, $1
; MIPS32-NEXT:    srl $2, $4, 28
; MIPS32-NEXT:    sll $3, $5, 4
; MIPS32-NEXT:    or $2, $3, $2
; MIPS32-NEXT:    subu $1, $2, $1
; MIPS32-NEXT:    sll $2, $4, 1
; MIPS32-NEXT:    sll $3, $4, 4
; MIPS32-NEXT:    sltu $6, $3, $2
; MIPS32-NEXT:    subu $1, $1, $6
; MIPS32-NEXT:    subu $2, $3, $2
; MIPS32-NEXT:    sll $3, $4, 6
; MIPS32-NEXT:    subu $6, $3, $2
; MIPS32-NEXT:    srl $7, $4, 26
; MIPS32-NEXT:    sll $8, $5, 6
; MIPS32-NEXT:    or $7, $8, $7
; MIPS32-NEXT:    sll $8, $4, 8
; MIPS32-NEXT:    subu $1, $7, $1
; MIPS32-NEXT:    subu $7, $8, $6
; MIPS32-NEXT:    sll $9, $4, 10
; MIPS32-NEXT:    subu $10, $9, $7
; MIPS32-NEXT:    sltu $2, $3, $2
; MIPS32-NEXT:    sll $3, $4, 13
; MIPS32-NEXT:    srl $11, $4, 24
; MIPS32-NEXT:    sll $12, $5, 8
; MIPS32-NEXT:    subu $1, $1, $2
; MIPS32-NEXT:    or $2, $12, $11
; MIPS32-NEXT:    subu $11, $3, $10
; MIPS32-NEXT:    srl $12, $4, 22
; MIPS32-NEXT:    sll $13, $5, 10
; MIPS32-NEXT:    sll $14, $4, 16
; MIPS32-NEXT:    subu $15, $14, $11
; MIPS32-NEXT:    srl $24, $4, 14
; MIPS32-NEXT:    srl $25, $4, 12
; MIPS32-NEXT:    srl $gp, $4, 10
; MIPS32-NEXT:    srl $16, $4, 8
; MIPS32-NEXT:    subu $1, $2, $1
; MIPS32-NEXT:    or $2, $13, $12
; MIPS32-NEXT:    sltu $6, $8, $6
; MIPS32-NEXT:    srl $8, $4, 19
; MIPS32-NEXT:    sll $12, $5, 13
; MIPS32-NEXT:    srl $13, $4, 16
; MIPS32-NEXT:    sll $17, $5, 16
; MIPS32-NEXT:    sll $18, $5, 18
; MIPS32-NEXT:    sll $19, $5, 20
; MIPS32-NEXT:    sll $20, $5, 22
; MIPS32-NEXT:    sll $5, $5, 24
; MIPS32-NEXT:    sll $21, $4, 18
; MIPS32-NEXT:    subu $22, $21, $15
; MIPS32-NEXT:    or $5, $5, $16
; MIPS32-NEXT:    or $gp, $20, $gp
; MIPS32-NEXT:    or $25, $19, $25
; MIPS32-NEXT:    or $24, $18, $24
; MIPS32-NEXT:    or $13, $17, $13
; MIPS32-NEXT:    or $8, $12, $8
; MIPS32-NEXT:    sll $12, $4, 24
; MIPS32-NEXT:    sll $16, $4, 22
; MIPS32-NEXT:    sll $4, $4, 20
; MIPS32-NEXT:    subu $1, $1, $6
; MIPS32-NEXT:    subu $1, $2, $1
; MIPS32-NEXT:    sltu $2, $9, $7
; MIPS32-NEXT:    subu $1, $1, $2
; MIPS32-NEXT:    subu $1, $8, $1
; MIPS32-NEXT:    sltu $2, $3, $10
; MIPS32-NEXT:    subu $1, $1, $2
; MIPS32-NEXT:    subu $1, $13, $1
; MIPS32-NEXT:    sltu $2, $14, $11
; MIPS32-NEXT:    subu $1, $1, $2
; MIPS32-NEXT:    subu $1, $24, $1
; MIPS32-NEXT:    addu $3, $4, $22
; MIPS32-NEXT:    sltu $2, $21, $15
; MIPS32-NEXT:    subu $1, $1, $2
; MIPS32-NEXT:    addu $6, $16, $3
; MIPS32-NEXT:    addu $1, $25, $1
; MIPS32-NEXT:    addu $2, $12, $6
; MIPS32-NEXT:    sltu $7, $2, $12
; MIPS32-NEXT:    sltu $6, $6, $16
; MIPS32-NEXT:    sltu $3, $3, $4
; MIPS32-NEXT:    addu $1, $1, $3
; MIPS32-NEXT:    addu $1, $gp, $1
; MIPS32-NEXT:    addu $1, $1, $6
; MIPS32-NEXT:    addu $1, $5, $1
; MIPS32-NEXT:    addu $3, $1, $7
; MIPS32-NEXT:    lw $16, 4($sp) # 4-byte Folded Reload
; MIPS32-NEXT:    lw $17, 8($sp) # 4-byte Folded Reload
; MIPS32-NEXT:    lw $18, 12($sp) # 4-byte Folded Reload
; MIPS32-NEXT:    lw $19, 16($sp) # 4-byte Folded Reload
; MIPS32-NEXT:    lw $20, 20($sp) # 4-byte Folded Reload
; MIPS32-NEXT:    lw $21, 24($sp) # 4-byte Folded Reload
; MIPS32-NEXT:    lw $22, 28($sp) # 4-byte Folded Reload
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    addiu $sp, $sp, 32
;
; MIPS64-LABEL: mul22224078_64:
; MIPS64:       # %bb.0: # %entry
; MIPS64-NEXT:    dsll $1, $4, 1
; MIPS64-NEXT:    dsll $2, $4, 4
; MIPS64-NEXT:    dsubu $1, $2, $1
; MIPS64-NEXT:    dsll $2, $4, 6
; MIPS64-NEXT:    dsubu $1, $2, $1
; MIPS64-NEXT:    dsll $2, $4, 8
; MIPS64-NEXT:    dsubu $1, $2, $1
; MIPS64-NEXT:    dsll $2, $4, 10
; MIPS64-NEXT:    dsubu $1, $2, $1
; MIPS64-NEXT:    dsll $2, $4, 13
; MIPS64-NEXT:    dsubu $1, $2, $1
; MIPS64-NEXT:    dsll $2, $4, 16
; MIPS64-NEXT:    dsubu $1, $2, $1
; MIPS64-NEXT:    dsll $2, $4, 24
; MIPS64-NEXT:    dsll $3, $4, 22
; MIPS64-NEXT:    dsll $5, $4, 20
; MIPS64-NEXT:    dsll $4, $4, 18
; MIPS64-NEXT:    dsubu $1, $4, $1
; MIPS64-NEXT:    daddu $1, $5, $1
; MIPS64-NEXT:    daddu $1, $3, $1
; MIPS64-NEXT:    jr $ra
; MIPS64-NEXT:    daddu $2, $2, $1
entry:
  %b = mul i64 %a, 22224078
  ret i64 %b
}

define i32 @mul22245375_32(i32 %a) {
; MIPS32-LABEL: mul22245375_32:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    sll $1, $4, 12
; MIPS32-NEXT:    addu $1, $1, $4
; MIPS32-NEXT:    sll $2, $4, 15
; MIPS32-NEXT:    addu $1, $2, $1
; MIPS32-NEXT:    sll $2, $4, 18
; MIPS32-NEXT:    subu $1, $2, $1
; MIPS32-NEXT:    sll $2, $4, 20
; MIPS32-NEXT:    addu $1, $2, $1
; MIPS32-NEXT:    sll $2, $4, 22
; MIPS32-NEXT:    addu $1, $2, $1
; MIPS32-NEXT:    sll $2, $4, 24
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    addu $2, $2, $1
;
; MIPS64-LABEL: mul22245375_32:
; MIPS64:       # %bb.0: # %entry
; MIPS64-NEXT:    sll $1, $4, 0
; MIPS64-NEXT:    sll $2, $1, 12
; MIPS64-NEXT:    addu $2, $2, $1
; MIPS64-NEXT:    sll $3, $1, 15
; MIPS64-NEXT:    addu $2, $3, $2
; MIPS64-NEXT:    sll $3, $1, 18
; MIPS64-NEXT:    subu $2, $3, $2
; MIPS64-NEXT:    sll $3, $1, 20
; MIPS64-NEXT:    addu $2, $3, $2
; MIPS64-NEXT:    sll $3, $1, 22
; MIPS64-NEXT:    addu $2, $3, $2
; MIPS64-NEXT:    sll $1, $1, 24
; MIPS64-NEXT:    jr $ra
; MIPS64-NEXT:    addu $2, $1, $2
entry:
  %b = mul i32 %a, 22245375
  ret i32 %b
}

define i64 @mul22245375_64(i64 %a) {
; MIPS32-LABEL: mul22245375_64:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    sll $1, $4, 12
; MIPS32-NEXT:    addu $2, $1, $4
; MIPS32-NEXT:    sltu $1, $2, $1
; MIPS32-NEXT:    srl $3, $4, 20
; MIPS32-NEXT:    sll $6, $5, 12
; MIPS32-NEXT:    or $3, $6, $3
; MIPS32-NEXT:    addu $3, $3, $5
; MIPS32-NEXT:    addu $1, $3, $1
; MIPS32-NEXT:    srl $3, $4, 17
; MIPS32-NEXT:    sll $6, $5, 15
; MIPS32-NEXT:    or $3, $6, $3
; MIPS32-NEXT:    addu $1, $3, $1
; MIPS32-NEXT:    sll $3, $4, 15
; MIPS32-NEXT:    addu $2, $3, $2
; MIPS32-NEXT:    sltu $3, $2, $3
; MIPS32-NEXT:    addu $1, $1, $3
; MIPS32-NEXT:    srl $3, $4, 14
; MIPS32-NEXT:    sll $6, $5, 18
; MIPS32-NEXT:    or $3, $6, $3
; MIPS32-NEXT:    srl $6, $4, 12
; MIPS32-NEXT:    sll $7, $5, 20
; MIPS32-NEXT:    subu $1, $3, $1
; MIPS32-NEXT:    or $3, $7, $6
; MIPS32-NEXT:    sll $6, $4, 18
; MIPS32-NEXT:    srl $7, $4, 10
; MIPS32-NEXT:    sll $8, $5, 22
; MIPS32-NEXT:    srl $9, $4, 8
; MIPS32-NEXT:    sll $5, $5, 24
; MIPS32-NEXT:    or $5, $5, $9
; MIPS32-NEXT:    or $7, $8, $7
; MIPS32-NEXT:    sltu $8, $6, $2
; MIPS32-NEXT:    sll $9, $4, 24
; MIPS32-NEXT:    sll $10, $4, 22
; MIPS32-NEXT:    sll $4, $4, 20
; MIPS32-NEXT:    subu $1, $1, $8
; MIPS32-NEXT:    addu $1, $3, $1
; MIPS32-NEXT:    subu $2, $6, $2
; MIPS32-NEXT:    addu $2, $4, $2
; MIPS32-NEXT:    sltu $3, $2, $4
; MIPS32-NEXT:    addu $1, $1, $3
; MIPS32-NEXT:    addu $1, $7, $1
; MIPS32-NEXT:    addu $2, $10, $2
; MIPS32-NEXT:    sltu $3, $2, $10
; MIPS32-NEXT:    addu $1, $1, $3
; MIPS32-NEXT:    addu $1, $5, $1
; MIPS32-NEXT:    addu $2, $9, $2
; MIPS32-NEXT:    sltu $3, $2, $9
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    addu $3, $1, $3
;
; MIPS64-LABEL: mul22245375_64:
; MIPS64:       # %bb.0: # %entry
; MIPS64-NEXT:    dsll $1, $4, 12
; MIPS64-NEXT:    daddu $1, $1, $4
; MIPS64-NEXT:    dsll $2, $4, 15
; MIPS64-NEXT:    daddu $1, $2, $1
; MIPS64-NEXT:    dsll $2, $4, 18
; MIPS64-NEXT:    dsubu $1, $2, $1
; MIPS64-NEXT:    dsll $2, $4, 20
; MIPS64-NEXT:    daddu $1, $2, $1
; MIPS64-NEXT:    dsll $2, $4, 22
; MIPS64-NEXT:    daddu $1, $2, $1
; MIPS64-NEXT:    dsll $2, $4, 24
; MIPS64-NEXT:    jr $ra
; MIPS64-NEXT:    daddu $2, $2, $1
entry:
  %b = mul i64 %a, 22245375
  ret i64 %b
}

define i32 @mul25165824_32(i32 %a) {
; MIPS32-LABEL: mul25165824_32:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    sll $1, $4, 12
; MIPS32-NEXT:    addu $1, $1, $4
; MIPS32-NEXT:    sll $2, $4, 15
; MIPS32-NEXT:    addu $1, $2, $1
; MIPS32-NEXT:    sll $2, $4, 18
; MIPS32-NEXT:    subu $1, $2, $1
; MIPS32-NEXT:    sll $2, $4, 20
; MIPS32-NEXT:    addu $1, $2, $1
; MIPS32-NEXT:    sll $2, $4, 22
; MIPS32-NEXT:    addu $1, $2, $1
; MIPS32-NEXT:    sll $2, $4, 24
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    addu $2, $2, $1
;
; MIPS64-LABEL: mul25165824_32:
; MIPS64:       # %bb.0: # %entry
; MIPS64-NEXT:    sll $1, $4, 0
; MIPS64-NEXT:    sll $2, $1, 12
; MIPS64-NEXT:    addu $2, $2, $1
; MIPS64-NEXT:    sll $3, $1, 15
; MIPS64-NEXT:    addu $2, $3, $2
; MIPS64-NEXT:    sll $3, $1, 18
; MIPS64-NEXT:    subu $2, $3, $2
; MIPS64-NEXT:    sll $3, $1, 20
; MIPS64-NEXT:    addu $2, $3, $2
; MIPS64-NEXT:    sll $3, $1, 22
; MIPS64-NEXT:    addu $2, $3, $2
; MIPS64-NEXT:    sll $1, $1, 24
; MIPS64-NEXT:    jr $ra
; MIPS64-NEXT:    addu $2, $1, $2
entry:
  %b = mul i32 %a, 22245375
  ret i32 %b
}

define i64 @mul25165824_64(i64 %a) {
; MIPS32-LABEL: mul25165824_64:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    srl $1, $4, 9
; MIPS32-NEXT:    sll $2, $5, 23
; MIPS32-NEXT:    or $1, $2, $1
; MIPS32-NEXT:    srl $2, $4, 8
; MIPS32-NEXT:    sll $3, $5, 24
; MIPS32-NEXT:    or $2, $3, $2
; MIPS32-NEXT:    addu $1, $2, $1
; MIPS32-NEXT:    sll $2, $4, 23
; MIPS32-NEXT:    sll $3, $4, 24
; MIPS32-NEXT:    addu $2, $3, $2
; MIPS32-NEXT:    sltu $3, $2, $3
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    addu $3, $1, $3
;
; MIPS64-LABEL: mul25165824_64:
; MIPS64:       # %bb.0: # %entry
; MIPS64-NEXT:    dsll $1, $4, 23
; MIPS64-NEXT:    dsll $2, $4, 24
; MIPS64-NEXT:    jr $ra
; MIPS64-NEXT:    daddu $2, $2, $1
entry:
  %b = mul i64 %a, 25165824
  ret i64 %b
}

define i32 @mul33554432_32(i32 %a) {
; MIPS32-LABEL: mul33554432_32:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    sll $1, $4, 12
; MIPS32-NEXT:    addu $1, $1, $4
; MIPS32-NEXT:    sll $2, $4, 15
; MIPS32-NEXT:    addu $1, $2, $1
; MIPS32-NEXT:    sll $2, $4, 18
; MIPS32-NEXT:    subu $1, $2, $1
; MIPS32-NEXT:    sll $2, $4, 20
; MIPS32-NEXT:    addu $1, $2, $1
; MIPS32-NEXT:    sll $2, $4, 22
; MIPS32-NEXT:    addu $1, $2, $1
; MIPS32-NEXT:    sll $2, $4, 24
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    addu $2, $2, $1
;
; MIPS64-LABEL: mul33554432_32:
; MIPS64:       # %bb.0: # %entry
; MIPS64-NEXT:    sll $1, $4, 0
; MIPS64-NEXT:    sll $2, $1, 12
; MIPS64-NEXT:    addu $2, $2, $1
; MIPS64-NEXT:    sll $3, $1, 15
; MIPS64-NEXT:    addu $2, $3, $2
; MIPS64-NEXT:    sll $3, $1, 18
; MIPS64-NEXT:    subu $2, $3, $2
; MIPS64-NEXT:    sll $3, $1, 20
; MIPS64-NEXT:    addu $2, $3, $2
; MIPS64-NEXT:    sll $3, $1, 22
; MIPS64-NEXT:    addu $2, $3, $2
; MIPS64-NEXT:    sll $1, $1, 24
; MIPS64-NEXT:    jr $ra
; MIPS64-NEXT:    addu $2, $1, $2
entry:
  %b = mul i32 %a, 22245375
  ret i32 %b
}

define i64 @mul33554432_64(i64 %a) {
; MIPS32-LABEL: mul33554432_64:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    srl $1, $4, 7
; MIPS32-NEXT:    sll $2, $5, 25
; MIPS32-NEXT:    or $3, $2, $1
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    sll $2, $4, 25
;
; MIPS64-LABEL: mul33554432_64:
; MIPS64:       # %bb.0: # %entry
; MIPS64-NEXT:    jr $ra
; MIPS64-NEXT:    dsll $2, $4, 25
entry:
  %b = mul i64 %a, 33554432
  ret i64 %b
}