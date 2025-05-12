# VGA offset = 8192
# addi x3, x0, 2047
# addi x3, x3, 2047
# addi x3, x3, 2047
# addi x3, x3, 2047
# addi x3, x3, 4

# VGA offset = 2048
addi x3, x0, 2047
addi x3, x3, 1

# Generate 20-bit value into x30 (white + '|')
addi x30, x0, 15
slli x30, x30, 4
addi x30, x30, 15
slli x30, x30, 4
addi x30, x30, 15
slli x30, x30, 8
addi x30, x30, 124       # 0xfff7c

# Generate 20-bit value into x31 (white + '#')
addi x31, x0, 15
slli x31, x31, 4
addi x31, x31, 15
slli x31, x31, 4
addi x31, x31, 15
slli x31, x31, 8
addi x31, x31, 35       # 0xfff23

#------------------------------------------------------------
# Vertical splitter
#------------------------------------------------------------
# Set constant x = 23
addi x5, x0, 23        # x = 23

# Initialize y = 0
addi x6, x0, 0         # y = 0

# Set upper bound y = 27
addi x7, x0, 27      

vertical_loop:
    # Compute address: x8 = x * 32 + y
    slli x8, x5, 5     # x << 5
    add  x8, x8, x6   # x << 5  + y

    slli x9, x8, 2 # shift left by 2 to get byte address
    
    # Store to RAM
    sw x30, 0(x9)

    # Store to VGA
    add x10, x3, x8
    slli x10, x10, 2 # shift left by 2 to get byte address

    sw x30, 0(x10)

    # Increment y
    addi x6, x6, 1

    # Compare y and y_end using subtraction
    sub x11, x7, x6    
    bne x11, x0, vertical_loop

# Compute address: x8 = x * 32 + y
addi x6, x0, 0          # y = 0
addi x5, x0, 23         # x = 23
addi x7, x0, 27         # y_end = 27

# Initialize address index register
addi x12, x0, 0    # index = 0

load_from_bar:

    slli x8, x5, 5     # x << 5
    add  x8, x8, x6   # x << 5  + y

    slli x9, x8, 2 # shift left by 2 to get byte address
    
    # Load from RAM
    lw x20, 0(x9)

    # Store to RAM at 4*x12
    slli x13, x12, 2
    sw x20, 0(x3)

    # Increment y
    addi x6, x6, 1

    # Increment logical store index
    addi x12, x12, 1

    # Compare y and y_end using subtraction
    sub x11, x7, x6    
    bne x11, x0, load_from_bar