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
    # Compute address: x11 = x * 32 + y
    slli x8, x5, 5     # x << 5
    add  x8, x8, x6   # x << 5  + y

    # Store to RAM
    sw x30, 0(x8)

    # Store to VGA 
    add x10, x3, x8
    sw x30, 0(x10)

    # Increment y
    addi x6, x6, 1

    # Compare y and y_end using subtraction
    sub x11, x7, x6    
    bne x11, x0, vertical_loop 

#------------------------------------------------------------
# Smiley face generator
#------------------------------------------------------------

j list_numbers 

store_ram_vga:
    # store into RAM
    sw x31, 0(x9)

     # Store to VGA 
    add x12, x3, x9
    sw x31, 0(x12)

    ret 

list_numbers: 
   
  # (9,5)
    addi x7, x0, 9
    addi x8, x0, 32
    mul x9, x7, x8
    addi x9, x9, 5
    jal ra, store_ram_vga

  # (10,5)
    addi x7, x0, 10
    addi x8, x0, 32
    mul x9, x7, x8
    addi x9, x9, 5

    jal ra, store_ram_vga
   
   # (11,5)
    addi x7, x0, 11
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 5
    jal ra, store_ram_vga

# (12,5)
    addi x7, x0, 12
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 5
    jal ra, store_ram_vga

# (13,5)
    addi x7, x0, 13
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 5
    jal ra, store_ram_vga

# (14,5)
    addi x7, x0, 14
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 5
    jal ra, store_ram_vga

# (15,6)
    addi x7, x0, 15
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 6
    jal ra, store_ram_vga

# (16,6)
    addi x7, x0, 16
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 6
    jal ra, store_ram_vga

# (17,7)
    addi x7, x0, 17
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 7
    jal ra, store_ram_vga

# (18,8)
    addi x7, x0, 18
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 8
    jal ra, store_ram_vga

# (19,9)
    addi x7, x0, 19
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 9
    jal ra, store_ram_vga

# (19,10)
    addi x7, x0, 19
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 10
    jal ra, store_ram_vga

# (20,11)
    addi x7, x0, 20
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 11
    jal ra, store_ram_vga

# (20,12)
    addi x7, x0, 20
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 12
    jal ra, store_ram_vga

# (20,13)
    addi x7, x0, 20
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 13
    jal ra, store_ram_vga

# (20,14)
    addi x7, x0, 20
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 14
    jal ra, store_ram_vga

# (20,15)
    addi x7, x0, 20
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 15
    jal ra, store_ram_vga

# (19,16)
    addi x7, x0, 19
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 16
    jal ra, store_ram_vga

# (19,17)
    addi x7, x0, 19
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 17
    jal ra, store_ram_vga

# (18,18)
    addi x7, x0, 18
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 18
    jal ra, store_ram_vga

# (17,19)
    addi x7, x0, 17
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 19
    jal ra, store_ram_vga

# (16,20)
    addi x7, x0, 16
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 20
    jal ra, store_ram_vga

# (15,20)
    addi x7, x0, 15
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 20
    jal ra, store_ram_vga 

# (14,21)
    addi x7, x0, 14
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 21
    jal ra, store_ram_vga

# (13,21)
    addi x7, x0, 13
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 21
    jal ra, store_ram_vga

# (12,21)
    addi x7, x0, 12
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 21
    jal ra, store_ram_vga

# (11,21)
    addi x7, x0, 11
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 21
    jal ra, store_ram_vga

# (10,21)
    addi x7, x0, 10
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 21
    jal ra, store_ram_vga

# (9,21)
    addi x7, x0, 9
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 21
    jal ra, store_ram_vga

# (8,20)
    addi x7, x0, 8
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 20
    jal ra, store_ram_vga

# (7,20)
    addi x7, x0, 7
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 20
    jal ra, store_ram_vga

# (6,19)
    addi x7, x0, 6
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 19
    jal ra, store_ram_vga

# (5,18)
    addi x7, x0, 5
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 18
    jal ra, store_ram_vga

# (4,17)
    addi x7, x0, 4
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 17
    jal ra, store_ram_vga

# (4,16)
    addi x7, x0, 4
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 16
    jal ra, store_ram_vga

# (3,15)
    addi x7, x0, 3
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 15
    jal ra, store_ram_vga

# (3,14)
    addi x7, x0, 3
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 14
    jal ra, store_ram_vga

# (3,13)
addi x7, x0, 3
addi x8, x0, 32
mul x9, x7, x8
addi x9, x9, 13
 jal ra, store_ram_vga

# (3,12)
addi x7, x0, 3
addi x8, x0, 32
mul x9, x7, x8
addi x9, x9, 12
 jal ra, store_ram_vga

# (3,11)
addi x7, x0, 3
addi x8, x0, 32
mul x9, x7, x8
addi x9, x9, 11
 jal ra, store_ram_vga

# (4,10)
addi x7, x0, 4
addi x8, x0, 32
mul x9, x7, x8
addi x9, x9, 10
jal ra, store_ram_vga

# (4,9)
addi x7, x0, 4
addi x8, x0, 32
mul x9, x7, x8
addi x9, x9, 9
jal ra, store_ram_vga

# (5,8)
addi x7, x0, 5
addi x8, x0, 32
mul x9, x7, x8
addi x9, x9, 8
sw x5, 0(x9)
jal ra, store_ram_vga

# (6,7)
addi x7, x0, 6
addi x8, x0, 32
mul x9, x7, x8
addi x9, x9,7
jal ra, store_ram_vga


# (7,6)
addi x7, x0, 7
addi x8, x0, 32
mul x9, x7, x8
addi x9, x9, 6
jal ra, store_ram_vga

# (8,6)
    addi x7, x0, 8
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 6
    jal ra, store_ram_vga

# (9,10)
    addi x7, x0, 9
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 10
    jal ra, store_ram_vga

# (8,15)
    addi x7, x0, 8
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 15
    jal ra, store_ram_vga

# (14,10)
    addi x7, x0, 14
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 10
    jal ra, store_ram_vga

# (9,16)
    addi x7, x0, 9
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 16
    jal ra, store_ram_vga

# (10,16)
    addi x7, x0, 10
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 16
    jal ra, store_ram_vga

# (11,16)
    addi x7, x0, 11
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 16
    jal ra, store_ram_vga

# (12,16)
    addi x7, x0, 12
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 16
    jal ra, store_ram_vga

# (13,16)
    addi x7, x0, 13
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 16
    jal ra, store_ram_vga

# (14,16)
    addi x7, x0, 14
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 16
    jal ra, store_ram_vga

# (15,15)
    addi x7, x0, 15
    addi x8, x0, 32
    mul  x9, x7, x8
    addi x9, x9, 15
    jal ra, store_ram_vga

    j done


done:    

# ------------------------------------------------------------
# — Initialization (after you compute x11 and x6) —
# ------------------------------------------------------------
# Build BUTTON_BASE = 7168  (0x1C00) into x4
    addi x4, x0, 2047       # x4 = 2047
    addi x4, x4, 2047      # x4 = 4094
    addi x4, x4, 2047     # x4 = 6141
    addi x4, x4, 1027    # x4 = 7168

li   x20, 32        # x20 ← starting X coordinate
li   x21, 3         # x21 ← starting Y coordinate
slli x20, x20, 5    # x20 = x20 << 5
add  x11, x20, x21  # x11 = pixel index (RAM address without offset)

add  x6,  x11, x3   # x6 = pixel addr + VGA_OFFSET

sw x31 0(x11)
sw x31 0(x6)

# track logical position
li   x13, 32        # XPOS ← 32 (must stay 24…47)
li   x14, 3         # YPOS ←  2 (must stay  0…26)

# Blank‐pixel value
addi x12, x0, 0     # x12 = 0

# ------------------------------------------------------------
# — Movement routines with boundary checks —
# ------------------------------------------------------------
button_loop:
    lw   x10, 0(x4)        # load 4‑byte key word from BUTTON_BASE

    li   x7,   7           # Key3 = left?  (you were using these codes)
    beq  x10, x7, left_pressed
    li   x7,  11           # Key2 = down?
    beq  x10, x7, down_pressed 
    li   x7,  13           # Key1 = up?
    beq  x10, x7, up_pressed
    li   x7,  14           # Key0 = right?
    beq  x10, x7, right_pressed

    jal  ra, button_loop         # no key → keep polling

left_pressed:
    li x7, 15 
    lw x10, 0(x4) 
    beq x7, x10, move_left 
    jal ra, left_pressed

up_pressed:
    li x7, 15 
    lw x10, 0(x4) 
    beq x7, x10, move_up
    jal ra, up_pressed

down_pressed:
    li x7, 15 
    lw x10, 0(x4) 
    beq x7, x10, move_down
    jal ra, down_pressed

right_pressed:
    li x7, 15 
    lw x10, 0(x4) 
    beq x7, x10, move_right 
    jal ra, right_pressed

move_left:
    li   x7, 24         # leftmost allowed X
    beq  x13, x7, button_loop  # if XPOS==24, skip move
    sw   x12, 0(x6)
    addi x13, x13, -1   # XPOS--
    addi x6,  x6,  -32  # VGA addr -= 32
    addi x11, x11, -32  # RAM addr -= 32
    sw   x31, 0(x6)
    jal  ra, button_loop

move_right:
    li   x7, 47         # rightmost allowed X
    beq  x13, x7, button_loop  # if XPOS==47, skip move
    sw   x12, 0(x6)
    addi x13, x13,  1   # XPOS++
    addi x6,  x6,   32  # VGA addr += 32
    addi x11, x11,   32 # RAM addr += 32
    sw   x31, 0(x6)
    jal  ra, button_loop

move_up:
    li   x7, 0          # topmost allowed Y
    beq  x14, x7, button_loop  # if YPOS==0, skip move
    sw   x12, 0(x6)
    addi x14, x14, -1   # YPOS--
    addi x6,  x6,  -1
    addi x11, x11,  -1
    sw   x31, 0(x6)
    jal  ra, button_loop

move_down:
    li   x7, 26         # bottommost allowed Y
    beq  x14, x7, button_loop  # if YPOS==26, skip move
    sw   x12, 0(x6)
    addi x14, x14,  1   # YPOS++
    addi x6,  x6,   1
    addi x11, x11,   1
    sw   x31, 0(x6)
    jal  ra, button_loop
