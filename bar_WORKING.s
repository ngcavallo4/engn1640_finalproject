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
    # Compute address: x11 = x * 32 + y
    slli x8, x5, 5     # x << 5
    add  x8, x8, x6   # x << 5  + y

    slli x9,x8,2 #shift left by 2 to get byte address

    # Store to RAM
    sw x30, 0(x9)

    # Store to VGA
    add x10, x3, x8
    slli x10,x10,2 #shift left by 2 to get byte address
    sw x30, 0(x10)

    # Increment y
    addi x6, x6, 1

    # Compare y and y_end using subtraction
    sub x11, x7, x6    
    bne x11, x0, vertical_loop
