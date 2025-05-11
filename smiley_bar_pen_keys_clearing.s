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
 
   addi x16 x0 4
   beq x15, x16, verify_start
   
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

   
# —————————————————————————————
# verify_start: set up and call verify_list
#————————————————————————————
verify_start:
    # build X offset_index = 23 * 32
    addi  x20, x0, 23        # x20 = 23
    slli  x20, x20, 5        # x20 = 23 << 5 = 736

    # call the walk‐through routine
    jal   ra, verify_list

    # once done (no mismatches), return to drawing
    jal   ra, main_loop

# —————————————————————————————
# verify_list: for each (X,Y) in your static list,
#              compute index in x25 and call verify_coord
#————————————————————————————
verify_list:
    # (9,5)
    addi  x23, x0,  9        # static X
    addi  x24, x0,  5        # static Y
    slli  x25, x23, 5        # x25 = X << 5
    add   x25, x25, x24      # x25 = X*32 + Y
    jal   ra, verify_coord

    # (10,5)
    addi  x23, x0, 10
    addi  x24, x0,  5
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (11,5)
    addi  x23, x0, 11
    addi  x24, x0,  5
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (12,5)
    addi  x23, x0, 12
    addi  x24, x0,  5
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (13,5)
    addi  x23, x0, 13
    addi  x24, x0,  5
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (14,5)
    addi  x23, x0, 14
    addi  x24, x0,  5
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (15,6)
    addi  x23, x0, 15
    addi  x24, x0,  6
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (16,6)
    addi  x23, x0, 16
    addi  x24, x0,  6
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (17,7)
    addi  x23, x0, 17
    addi  x24, x0,  7
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (18,8)
    addi  x23, x0, 18
    addi  x24, x0,  8
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (19,9)
    addi  x23, x0, 19
    addi  x24, x0,  9
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (19,10)
    addi  x23, x0, 19
    addi  x24, x0, 10
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (20,11)
    addi  x23, x0, 20
    addi  x24, x0, 11
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (20,12)
    addi  x23, x0, 20
    addi  x24, x0, 12
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (20,13)
    addi  x23, x0, 20
    addi  x24, x0, 13
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (20,14)
    addi  x23, x0, 20
    addi  x24, x0, 14
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (20,15)
    addi  x23, x0, 20
    addi  x24, x0, 15
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (19,16)
    addi  x23, x0, 19
    addi  x24, x0, 16
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (19,17)
    addi  x23, x0, 19
    addi  x24, x0, 17
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (18,18)
    addi  x23, x0, 18
    addi  x24, x0, 18
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (17,19)
    addi  x23, x0, 17
    addi  x24, x0, 19
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (16,20)
    addi  x23, x0, 16
    addi  x24, x0, 20
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (15,20)
    addi  x23, x0, 15
    addi  x24, x0, 20
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (14,21)
    addi  x23, x0, 14
    addi  x24, x0, 21
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (13,21)
    addi  x23, x0, 13
    addi  x24, x0, 21
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (12,21)
    addi  x23, x0, 12
    addi  x24, x0, 21
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (11,21)
    addi  x23, x0, 11
    addi  x24, x0, 21
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (10,21)
    addi  x23, x0, 10
    addi  x24, x0, 21
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (9,21)
    addi  x23, x0,  9
    addi  x24, x0, 21
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (8,20)
    addi  x23, x0,  8
    addi  x24, x0, 20
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (7,20)
    addi  x23, x0,  7
    addi  x24, x0, 20
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (6,19)
    addi  x23, x0,  6
    addi  x24, x0, 19
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (5,18)
    addi  x23, x0,  5
    addi  x24, x0, 18
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (4,17)
    addi  x23, x0,  4
    addi  x24, x0, 17
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (4,16)
    addi  x23, x0,  4
    addi  x24, x0, 16
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (3,15)
    addi  x23, x0,  3
    addi  x24, x0, 15
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (3,14)
    addi  x23, x0,  3
    addi  x24, x0, 14
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (3,13)
    addi  x23, x0,  3
    addi  x24, x0, 13
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (3,12)
    addi  x23, x0,  3
    addi  x24, x0, 12
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (3,11)
    addi  x23, x0,  3
    addi  x24, x0, 11
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (4,10)
    addi  x23, x0,  4
    addi  x24, x0, 10
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (4,9)
    addi  x23, x0,  4
    addi  x24, x0,  9
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (5,8)
    addi  x23, x0,  5
    addi  x24, x0,  8
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (6,7)
    addi  x23, x0,  6
    addi  x24, x0,  7
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (7,6)
    addi  x23, x0,  7
    addi  x24, x0,  6
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (8,6)
    addi  x23, x0,  8
    addi  x24, x0,  6
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (9,10)
    addi  x23, x0,  9
    addi  x24, x0, 10
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (8,15)
    addi  x23, x0,  8
    addi  x24, x0, 15
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (14,10)
    addi  x23, x0, 14
    addi  x24, x0, 10
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (9,16)
    addi  x23, x0,  9
    addi  x24, x0, 16
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (10,16)
    addi  x23, x0, 10
    addi  x24, x0, 16
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (11,16)
    addi  x23, x0, 11
    addi  x24, x0, 16
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (12,16)
    addi  x23, x0, 12
    addi  x24, x0, 16
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (13,16)
    addi  x23, x0, 13
    addi  x24, x0, 16
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (14,16)
    addi  x23, x0, 14
    addi  x24, x0, 16
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    # (15,15)
    addi  x23, x0, 15
    addi  x24, x0, 15
    slli  x25, x23, 5
    add   x25, x25, x24
    jal   ra, verify_coord

    ret

# —————————————————————————————
# verify_coord: x25 = static pixel index; x20 = offset_index
# —————————————————————————————
verify_coord:
# x25 = user coord 
# x26 = user coord + static offset

    add   x26, x25, x20      # x26 = user_index = static_index + offset
    lw    x27, 0(x26)        # x27 = word at RAM[user_index]
    nop 
    bne   x27, x31, verify_fail
    ret

# —————————————————————————————
# verify_fail: first mismatch — jump here
#             clear screen, then print "YOU FAILED :(" in red
# —————————————————————————————
verify_fail: 
# --- clear entire char buffer (0…2047) using only BEQ/BNE ---
    addi  x26, x0, 0        # idx = 0
    
    addi x27, x0, 2047
    addi x27, x27, 1         # end = 2048 entries
clr_loop:
    add   x12, x3, x26      # addr = VGA_BASE + idx
    addi  x13, x0, 32       # data = ASCII 32, color=0
    sw    x13, 0(x12)
    nop
    addi  x26, x26, 1       # idx++
    sub   x29, x27, x26     # x29 = end - idx
    bne   x29, x0, clr_loop # if idx < end (i.e. end-idx ≠ 0) repeat

    # --- build red‐only color nibble ---
    addi  x28, x0, 15       # red = 0xF
    slli  x28, x28, 16      # red<<16

    # --- starting position for centered text ---
    addi  x23, x0, 17       # X = 17
    addi  x24, x0, 13       # Y = 13
	
    j write_you_failed 

# write_char macro (uses only BEQ/BNE in verify_fail, so fine)
write_char:
    or    x30, x30, x28     # color|ASCII
    slli  x25, x23, 5
    add   x25, x25, x24
    add   x25, x3, x25      # VGA_BASE + index
    sw    x30, 0(x25)
    addi  x23, x23, 1
    ret

write_you_failed:
    # --- print "YOU FAILED :(" ---
    addi  x30, x0, 'Y'
    jal ra, write_char
    addi  x30, x0, 'O'
    jal ra, write_char
    addi  x30, x0, 'U'
    jal ra, write_char
    addi  x30, x0, ' ' 
    jal ra, write_char
    addi  x30, x0, 'F'
    jal ra, write_char
    addi  x30, x0, 'A'
    jal ra, write_char
    addi  x30, x0, 'I'
    jal ra, write_char
    addi  x30, x0, 'L'
    jal ra, write_char
    addi  x30, x0, 'E'
    jal ra, write_char
    addi  x30, x0, 'D'
    jal ra, write_char
    addi  x30, x0, ' ' 
    jal ra, write_char
    addi  x30, x0, ':' 
    jal ra, write_char
    addi  x30, x0, '(' 
    jal ra, write_char

   j end 

end: add x0 x0 x0 (halt) 



