# --------------------------------------------
# This program writes a smiley in assembly
# --------------------------------------------

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

# Store 32 in x10 for indexing
addi x10, x0, 32

j list_coords

# store_ram_vga assumes x7 = x coordinate, x8 = y coordinate
store_ram_vga:
    mul x9, x7, x10       # x9 = x * 32
    add x9, x9, x8        # x9 = x * 32 + y (index)
    slli x13, x9, 2       # x13 = byte address
    sw x31, 0(x13)        # store into RAM

    add x14, x3, x9       # VGA addr = base + index
    slli x14, x14, 2      # byte address
    sw x31, 0(x14)        # store into VGA

    ret

list_coords:
# === list_coords ===
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
