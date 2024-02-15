main:
  li $v0, 8
  la $a0, buffer
  li $a1, 1000
  syscall

  jal_process_whole_string 

  li $v0, 10
  syscall

process_whole_string:
  move $s0, $a0

  li $s1, 26
  li $s2, 0
  li $t0, 10
  li $t1, 97
  li $t2, 65
  li $t3, 58
  li $t4, 47
  li $t5, 32
  li $t6, 0
  li $t7, 0

loop_whole_string
  lb $t8, ($s0)
  beq $t8, $zero, print_output
  beq $t8, $t4, process_substring
  ble $t0, $t8, is_num_or_letter
  j continue_loop

is_num_or_letter:
  bge $t8, $t1, is_lower
  j continue_loop

is_lower:
  bge $t8, $t2, is_upper
  sub $t8, $t8, $t1
  addi $t8, $t8, 10
  j calculate_sum

is_upper:
  sub $t8, $t8, $t2
  addi $t8, $t8, 10

calculate_sum:
  add $t7, $t7, $t8
  j continue_loop

process_substring:
  move $a0, $s0
  jal process_substring

  move $t9, $v0

  bgt $t6, $zero, print_delimiter
  li $v0, 1
  move $a0, $t9
  syscall
  j continue_loop

print_delimiter:
  li $v0, 4
  la $a0, space
  syscall
  li $v0, 4
  la $a0, space
  syscall

  li $v0, 4
  la $a0, slash
  syscall
  
  li $v0, 4
  la $a0, space
  syscall
  
  li $v0, 1
  move $a0, $t9
  syscall

continue_loop:
  addi $s0, $s0, 1   
  bgtz $t6, update_counter
  b continue_loop

  
  
