#———————————————————————————————————————————

# This program stores, then loads a white hash
# in location 1024 in RAM, then stores it in 
# location 512 in RAM. 

#———————————————————————————————————————————




# VGA offset = 2048
addi x3, x0, 2047
addi x3, x3, 1

# Generate 20-bit value into x31 (white + '#')
addi x31, x0, 15
slli x31, x31, 4
addi x31, x31, 15
slli x31, x31, 4
addi x31, x31, 15
slli x31, x31, 8
addi x31, x31, 35       # 0xfff23

# store white hash at 1024 
addi x25, x0, 1024
slli x26, x25, 2
sw x31 0(x26)

# load white hash at 1024
addi x25, x0, 1024
slli x26, x25, 2
lw x10 0(x26)

addi x20, x0, 512
sw x10 0(x20)