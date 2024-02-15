main:
  li $v0, 8
  la $a0, buffer
  li $a1, 1000
  syscall

  jal_process_whole_string 

  li $v0, 10
  syscall
