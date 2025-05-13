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
