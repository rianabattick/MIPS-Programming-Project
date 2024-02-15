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
  
  
