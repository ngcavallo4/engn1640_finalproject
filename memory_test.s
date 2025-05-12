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

# store at 12, 5 
addi  x23, x0, 12        # X = 12
addi  x24, x0,  5        # Y =  5
slli  x25, x23, 5        # X*32
add   x25, x25, x24      # X*32 + Y
jal   ra, store_ram_vga 

addi  x23, x0, 12        # X = 12
addi  x24, x0,  5        # Y =  5
slli  x25, x23, 5        # X*32
add   x25, x25, x24      # X*32 + Y
slli x26, x25, 2

lw x7 0(x26) 

store_ram_vga:
    # store into RAM
    slli x26, x25, 2
    
    sw x31, 0(x26)

     # Store to VGA 
    add x9, x3, x25
    slli x9, x9, 2
    sw x31, 0(x9)

    ret 

add x0 x0 x0 