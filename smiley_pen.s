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

j list_coords

#----------------------------
# store ram vga helper func
#----------------------------
# store_ram_vga assumes x7 = x coordinate, x8 = y coordinate
store_ram_vga:
    mul x9, x7, x12       # x9 = x * 32 (x12 = 32)
    add x9, x9, x8        # x9 = x * 32 + y (index)
    slli x13, x9, 2       # x13 = byte address
    sw x31, 0(x13)        # store into RAM

    add x14, x3, x9       # VGA addr = base + index
    slli x14, x14, 2      # byte address
    sw x31, 0(x14)        # store into VGA

    ret
#----------------------------
# list coords helper func
#----------------------------
list_coords:
# === list_coords ===
li x12 32 # 32 is offset for address calculation 

li x7, 9     # x
li x8, 5     # y
jal ra, store_ram_vga

li x7, 10
li x8, 5
jal ra, store_ram_vga

li x7, 11
li x8, 5
jal ra, store_ram_vga

li x7, 12
li x8, 5
jal ra, store_ram_vga

li x7, 13
li x8, 5
jal ra, store_ram_vga

li x7, 14
li x8, 5
jal ra, store_ram_vga

li x7, 15
li x8, 6
jal ra, store_ram_vga

li x7, 16
li x8, 6
jal ra, store_ram_vga

li x7, 17
li x8, 7
jal ra, store_ram_vga

li x7, 18
li x8, 8
jal ra, store_ram_vga

li x7, 19
li x8, 9
jal ra, store_ram_vga

li x7, 19
li x8, 10
jal ra, store_ram_vga

li x7, 20
li x8, 11
jal ra, store_ram_vga

li x7, 20
li x8, 12
jal ra, store_ram_vga

li x7, 20
li x8, 13
jal ra, store_ram_vga

li x7, 20
li x8, 14
jal ra, store_ram_vga

li x7, 20
li x8, 15
jal ra, store_ram_vga

li x7, 19
li x8, 16
jal ra, store_ram_vga

li x7, 19
li x8, 17
jal ra, store_ram_vga

li x7, 18
li x8, 18
jal ra, store_ram_vga

li x7, 17
li x8, 19
jal ra, store_ram_vga

li x7, 16
li x8, 20
jal ra, store_ram_vga

li x7, 15
li x8, 20
jal ra, store_ram_vga

li x7, 14
li x8, 21
jal ra, store_ram_vga

li x7, 13
li x8, 21
jal ra, store_ram_vga

li x7, 12
li x8, 21
jal ra, store_ram_vga

li x7, 11
li x8, 21
jal ra, store_ram_vga

li x7, 10
li x8, 21
jal ra, store_ram_vga

li x7, 9
li x8, 21
jal ra, store_ram_vga

li x7, 8
li x8, 20
jal ra, store_ram_vga

li x7, 7
li x8, 20
jal ra, store_ram_vga

li x7, 6
li x8, 19
jal ra, store_ram_vga

li x7, 5
li x8, 18
jal ra, store_ram_vga

li x7, 4
li x8, 17
jal ra, store_ram_vga

li x7, 4
li x8, 16
jal ra, store_ram_vga

li x7, 3
li x8, 15
jal ra, store_ram_vga

li x7, 3
li x8, 14
jal ra, store_ram_vga

li x7, 3
li x8, 13
jal ra, store_ram_vga

li x7, 3
li x8, 12
jal ra, store_ram_vga

li x7, 3
li x8, 11
jal ra, store_ram_vga

li x7, 4
li x8, 10
jal ra, store_ram_vga

li x7, 4
li x8, 9
jal ra, store_ram_vga

li x7, 5
li x8, 8
jal ra, store_ram_vga

li x7, 6
li x8, 7
jal ra, store_ram_vga

li x7, 7
li x8, 6
jal ra, store_ram_vga

li x7, 8
li x8, 6
jal ra, store_ram_vga

li x7, 9
li x8, 10
jal ra, store_ram_vga

li x7, 8
li x8, 15
jal ra, store_ram_vga

li x7, 14
li x8, 10
jal ra, store_ram_vga

li x7, 9
li x8, 16
jal ra, store_ram_vga

li x7, 10
li x8, 16
jal ra, store_ram_vga

li x7, 11
li x8, 16
jal ra, store_ram_vga

li x7, 12
li x8, 16
jal ra, store_ram_vga

li x7, 13
li x8, 16
jal ra, store_ram_vga

li x7, 14
li x8, 16
jal ra, store_ram_vga

li x7, 15
li x8, 15
jal ra, store_ram_vga

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

#  Build BUTTON_BASE = 4096 into x4
addi x4, x0, 2047       # x4 = 2047
addi x4, x4, 2047       # x4 = 4094
addi x4, x4, 2          # x4 = 4096

slli x4, x4, 2 # shift left by 2 to get byte address

# Build SWITCHES_BASE = 4097 into x5
addi x5, x0, 2047       # x5 = 2047
addi x5, x5, 2047       # x4 = 4094
addi x5, x5, 3          # x5 = 4097

slli x5, x5, 2 # shift left by 2 to get byte address

# build constant black # in x18
addi x18, x0, 35       # 0x00023

li   x20, 32        # x20 ← starting X coordinate
li   x21, 6         # x21 ← starting Y coordinate
slli x20, x20, 5    # x20 = x20 << 5
add  x11, x20, x21  # x11 = pixel addr (RAM address without offset)

# Store to VGA and RAM
add x17, x0, x31 # starting with white hash
 
slli x12, x11, 2 # shift RAM address left by 2 to get byte address
sw x17 0(x12) # RAM store

add  x6,  x11, x3   # x6 = pixel addr + VGA_OFFSET
slli x12, x6, 2 # shift VGA address left by 2 to get byte address
sw x17 0(x12) # VGA store

# track logical position
li   x13, 32        # XPOS ← 32 (must stay 24…47)
li   x14, 6         # YPOS ←  6 (must stay  0…26)

# ------------------------------------------------------------
# SWITCHES AND BUTTONS MOVEMENT
# ------------------------------------------------------------
main_loop:
    lw   x10, 0(x4)        # load 4‑byte key word from BUTTON_BASE
    lw   x15, 0(x5)     #load 4-byte key word from SWITCH_BASE

    beq x15, x0, set_white
	jal x0, set_black

set_white:
    add x17, x0, x31 # white hash
    jal x0, button_loop

set_black:
    add x17, x0, x18 # black hash
    jal x0, button_loop
   
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


left_pressed:
    li x7, 15
    lw x10, 0(x4)
    nop
    beq x7, x10, move_left
    jal ra, left_pressed

up_pressed:
    li x7, 15
    lw x10, 0(x4)
    nop
    beq x7, x10, move_up
    jal ra, up_pressed

down_pressed:
    li x7, 15
    lw x10, 0(x4)
    nop
    beq x7, x10, move_down
    jal ra, down_pressed

right_pressed:
    li x7, 15
    lw x10, 0(x4)
    nop
    beq x7, x10, move_right
    jal ra, right_pressed

move_left:
    li   x7, 24         # leftmost allowed X
    beq  x13, x7, main_loop  # if XPOS==24, skip move
    addi x13, x13, -1   # XPOS--
   
    addi x6,  x6,  -32  # VGA addr -= 32
    slli x12, x6, 2 # shift VGA address left by 2 to get byte address
    sw   x17, 0(x12) # VGA store
    nop


    addi x11, x11, -32  # RAM addr -= 32
    slli x12, x11, 2 # shift RAM address left by 2 to get byte address
    sw   x17, 0(x12) # RAM store
   
    jal  ra, main_loop


move_right:
    li   x7, 47         # rightmost allowed X
    beq  x13, x7, main_loop  # if XPOS==47, skip move
    addi x13, x13,  1   # XPOS++

    addi x6,  x6,   32  # VGA addr += 32
    slli x12, x6, 2 # shift VGA address left by 2 to get byte address
    sw   x17, 0(x12) # VGA store
    nop

	addi x11, x11, 32 # RAM addr += 32
    slli x12, x11, 2 # shift RAM address left by 2 to get byte address
    sw   x17, 0(x12) # RAM store

	jal  ra, main_loop

move_up:
    li   x7, 0          # topmost allowed Y
    beq  x14, x7, main_loop  # if YPOS==0, skip move
    addi x14, x14, -1   # YPOS--

    addi x6,  x6,  -1
    slli x12, x6, 2 # shift VGA address left by 2 to get byte address
    sw   x17, 0(x12) # VGA store
    nop

    addi x11, x11,  -1
    slli x12, x11, 2 # shift RAM address left by 2 to get byte address
    sw   x17, 0(x12) # RAM store

    jal  ra, main_loop


move_down:
    li   x7, 26         # bottommost allowed Y
    beq  x14, x7, main_loop  # if YPOS==26, skip move
    addi x14, x14,  1   # YPOS++
   
    addi x6,  x6,   1
    slli x12, x6, 2 # shift VGA address left by 2 to get byte address
    sw   x17, 0(x12) # VGA store
    nop
   
    addi x11, x11,   1
    slli x12, x11, 2 # shift RAM address left by 2 to get byte address
    sw   x17, 0(x12) # RAM store

    jal  ra, main_loop