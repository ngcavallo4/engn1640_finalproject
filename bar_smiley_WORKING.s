# VGA offset = 2048
addi x3, x0, 2047
addi x3, x3, 1

# Generate 0xfff23 (white + '#') into x31
addi x31, x0, 15
slli x31, x31, 4
addi x31, x31, 15
slli x31, x31, 4
addi x31, x31, 15
slli x31, x31, 8
addi x31, x31, 35

# Generate 20-bit value into x30 (white + '|')
addi x30, x0, 15
slli x30, x30, 4
addi x30, x30, 15
slli x30, x30, 4
addi x30, x30, 15
slli x30, x30, 8
addi x30, x30, 124       # 0xfff7c

    # ────────────────────────────────────────────────────────────
    # Assume x3 = 2048 (VGA offset) and x31 holds the ball character
    # ────────────────────────────────────────────────────────────

    # === list_coords ===
    addi x7, x0, 9
    addi x8, x0, 5
    jal  store_coord

    addi x7, x0, 10
    addi x8, x0, 5
    jal  store_coord

    addi x7, x0, 11
    addi x8, x0, 5
    jal  store_coord

    addi x7, x0, 12
    addi x8, x0, 5
    jal  store_coord

    addi x7, x0, 13
    addi x8, x0, 5
    jal  store_coord

    addi x7, x0, 14
    addi x8, x0, 5
    jal  store_coord

    addi x7, x0, 15
    addi x8, x0, 6
    jal  store_coord

    addi x7, x0, 16
    addi x8, x0, 6
    jal  store_coord

    addi x7, x0, 17
    addi x8, x0, 7
    jal  store_coord

    addi x7, x0, 18
    addi x8, x0, 8
    jal  store_coord

    addi x7, x0, 19
    addi x8, x0, 9
    jal  store_coord

    addi x7, x0, 19
    addi x8, x0, 10
    jal  store_coord

    addi x7, x0, 20
    addi x8, x0, 11
    jal  store_coord

    addi x7, x0, 20
    addi x8, x0, 12
    jal  store_coord

    addi x7, x0, 20
    addi x8, x0, 13
    jal  store_coord

    addi x7, x0, 20
    addi x8, x0, 14
    jal  store_coord

    addi x7, x0, 20
    addi x8, x0, 15
    jal  store_coord

    addi x7, x0, 19
    addi x8, x0, 16
    jal  store_coord

    addi x7, x0, 19
    addi x8, x0, 17
    jal  store_coord

    addi x7, x0, 18
    addi x8, x0, 18
    jal  store_coord

    addi x7, x0, 17
    addi x8, x0, 19
    jal  store_coord

    addi x7, x0, 16
    addi x8, x0, 20
    jal  store_coord

    addi x7, x0, 15
    addi x8, x0, 20
    jal  store_coord

    addi x7, x0, 14
    addi x8, x0, 21
    jal  store_coord

    addi x7, x0, 13
    addi x8, x0, 21
    jal  store_coord

    addi x7, x0, 12
    addi x8, x0, 21
    jal  store_coord

    addi x7, x0, 11
    addi x8, x0, 21
    jal  store_coord

    addi x7, x0, 10
    addi x8, x0, 21
    jal  store_coord

    addi x7, x0, 9
    addi x8, x0, 21
    jal  store_coord

    addi x7, x0, 8
    addi x8, x0, 20
    jal  store_coord

    addi x7, x0, 7
    addi x8, x0, 20
    jal  store_coord

    addi x7, x0, 6
    addi x8, x0, 19
    jal  store_coord

    addi x7, x0, 5
    addi x8, x0, 18
    jal  store_coord

    addi x7, x0, 4
    addi x8, x0, 17
    jal  store_coord

    addi x7, x0, 4
    addi x8, x0, 16
    jal  store_coord

    addi x7, x0, 3
    addi x8, x0, 15
    jal  store_coord

    addi x7, x0, 3
    addi x8, x0, 14
    jal  store_coord

    addi x7, x0, 3
    addi x8, x0, 13
    jal  store_coord

    addi x7, x0, 3
    addi x8, x0, 12
    jal  store_coord

    addi x7, x0, 3
    addi x8, x0, 11
    jal  store_coord

    addi x7, x0, 4
    addi x8, x0, 10
    jal  store_coord

    addi x7, x0, 4
    addi x8, x0, 9
    jal  store_coord

    addi x7, x0, 5
    addi x8, x0, 8
    jal  store_coord

    addi x7, x0, 6
    addi x8, x0, 7
    jal  store_coord

    addi x7, x0, 7
    addi x8, x0, 6
    jal  store_coord

    addi x7, x0, 8
    addi x8, x0, 6
    jal  store_coord

    addi x7, x0, 9
    addi x8, x0, 10
    jal  store_coord

    addi x7, x0, 14
    addi x8, x0, 10
    jal  store_coord

    addi x7, x0, 8
    addi x8, x0, 15
    jal  store_coord

    addi x7, x0, 9
    addi x8, x0, 16
    jal  store_coord

    addi x7, x0, 10
    addi x8, x0, 16
    jal  store_coord

    addi x7, x0, 11
    addi x8, x0, 16
    jal  store_coord

    addi x7, x0, 12
    addi x8, x0, 16
    jal  store_coord

    addi x7, x0, 13
    addi x8, x0, 16
    jal  store_coord

    addi x7, x0, 14
    addi x8, x0, 16
    jal  store_coord

    addi x7, x0, 15
    addi x8, x0, 15
    jal  store_coord
    
    j splitter

    # ────────────────────────────────────────────────────────────
    # Helper: compute index, store to RAM then VGA, return
    # ────────────────────────────────────────────────────────────
store_coord:
    slli  x7, x7, 5        # x7 = x_index * 32
    add   x9, x7, x8      # x9 = x_index*32 + y_index
    slli  x10, x9, 2      # byte address = index << 2
    sw    x31, 0(x10)     # RAM store
    add   x10, x9, x3     # x10 = index + 2048
    slli  x10, x10, 2     # byte address = (index+2048)<<2
    sw    x31, 0(x10)     # VGA store
    jalr  x0, 0(x1)       # return

splitter: 
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