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

# ------------------------------------------------------------
# — Initialization (after you compute x11 and x6) —
# ------------------------------------------------------------
#  Build BUTTON_BASE = 7168  (0x1C00) into x4
    addi x4, x0, 2047       # x4 = 2047
    addi x4, x4, 2047      # x4 = 4094
    addi x4, x4, 2047     # x4 = 6141
    addi x4, x4, 1027    # x4 = 7168

    # Build SWITCHES_BASE = 7169  (0x1C00) into x5
   addi x5, x0, 2047       # x5 = 2047
    addi x5, x5, 2047      # x4 = 4094
    addi x5, x5, 2047     # x5 = 6141
    addi x5, x5, 1028    # x5 = 7169

 # build constant black # in x18 
 addi x18, x0, 35       # 0x00023

li   x20, 32        # x20 ← starting X coordinate
li   x21, 3         # x21 ← starting Y coordinate
slli x20, x20, 5    # x20 = x20 << 5

add  x11, x20, x21  # x11 = pixel index (RAM address without offset)
add  x6,  x11, x3   # x6 = pixel addr + VGA_OFFSET

# Store to VGA and RAM 
add x17, x0, x31 # starting with white hash
 
sw x17 0(x11) # RAM store
sw x17 0(x6) # VGA store

# track logical position
li   x13, 32        # XPOS ← 32 (must stay 24…47)
li   x14, 3         # YPOS ←  2 (must stay  0…26)

# Blank‐pixel value
addi x12, x0, 0     # x12 = 0

# ------------------------------------------------------------
# — Movement routines with boundary checks —
# ------------------------------------------------------------

main_loop:
    lw   x10, 0(x4)        # load 4‑byte key word from BUTTON_BASE
    lw   x15, 0(x5) 	#load 4-byte key word from SWITCH_BASE

   beq  x15, x0, set_white
   add x17, x0, x18 	# set x17 ← x18, black hash
   
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

    jal  ra, main_loop        # no key → keep polling

set_white:
    add x17, x0, x31 #set x17 ← x31, white hash
    jal  ra, button_loop          

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
    beq  x13, x7, main_loop  # if XPOS==24, skip move
    sw   x12, 0(x6)
    addi x13, x13, -1   # XPOS--
    addi x6,  x6,  -32  # VGA addr -= 32
    addi x11, x11, -32  # RAM addr -= 32
    sw   x17, 0(x6)
    jal  ra, main_loop

move_right:
    li   x7, 47         # rightmost allowed X
    beq  x13, x7, main_loop  # if XPOS==47, skip move
    sw   x12, 0(x6)
    addi x13, x13,  1   # XPOS++
    addi x6,  x6,   32  # VGA addr += 32
    addi x11, x11,   32 # RAM addr += 32
    sw   x17, 0(x6)
    jal  ra, main_loop

move_up:
    li   x7, 0          # topmost allowed Y
    beq  x14, x7, main_loop  # if YPOS==0, skip move
    sw   x12, 0(x6)
    addi x14, x14, -1   # YPOS--
    addi x6,  x6,  -1
    addi x11, x11,  -1
    sw   x17, 0(x6)
    jal  ra, main_loop

move_down:
    li   x7, 26         # bottommost allowed Y
    beq  x14, x7, main_loop  # if YPOS==26, skip move
    sw   x12, 0(x6)
    addi x14, x14,  1   # YPOS++
    addi x6,  x6,   1
    addi x11, x11,   1
    sw   x17, 0(x6)
    jal  ra, main_loop



