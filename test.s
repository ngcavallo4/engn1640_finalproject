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

# store white hash at 1024 
addi x25, x0, 1024
slli x26, x25, 2
sw x31 0(x26)

# Build SWITCHES_BASE = 4097 into x5
addi x5, x0, 2047       # x5 = 2047
addi x5, x5, 2047       # x4 = 4094
addi x5, x5, 3          # x5 = 4097
slli x5, x5, 2 # shift left by 2 to get byte address

main_loop:
    lw   x15, 0(x5)     #load 4-byte key word from SWITCH_BASE

    addi x16 x0 4
    beq x15, x16, verify_start
    
    jal ra, main_loop # keep polling
    
# —————————————————————————————
# verify_start: set up and call verify_list
#————————————————————————————
verify_start:
    # call the walk‐through routine
    jal   ra, verify_list


    # once done (no mismatches), return to drawing
    jal   ra, user_won
    
verify_list:

	# load at 64 
    addi x25, x0, 1024
    slli x26, x25, 2
    
    lw    x27, 0(x26)        # x27 = word at RAM[user_index]
    nop
    bne   x27, x31, user_lose
    
    j user_won 
    
# —————————————————————————————
# user_lose: clear & then display “YOU FAILED :(”
#————————————————————————————
user_lose:
    jal   ra, clear_screen
    jal   ra, display_failed
    jal   ra, game_over

# —————————————————————————————
# user_won: clear & then display “YOU WON :)”
#————————————————————————————
user_won:
    jal   ra, clear_screen
    jal   ra, display_won
    jal   ra, game_over
    
# —————————————————————————————
# clear_screen: wipe VGA buffer 0…2047
#————————————————————————————
clear_screen:
    addi  x26, x0, 0        # idx = 0

clr_loop:

    add   x12, x3, x26      # addr = VGA_BASE + idx
    addi  x13, x0, 32       # data = ASCII 32, color=0
    slli  x12, x12, 2       # addr = addr << 2
    nop
    sw    x13, 0(x12)
    nop
    addi  x26, x26, 1       # idx++
    sub   x29, x3, x26     # x29 = end - idx
    bne   x29, x0, clr_loop # if idx < end (i.e. end-idx ≠ 0) repeat
    ret


# —————————————————————————————
# write_char: draw one glyph at (x23,y24), then x23++
#————————————————————————————
write_char:
    or    x30, x30, x28     # x30 holds character, color|ASCII
    slli  x25, x23, 5
    add   x25, x25, x24
    add   x25, x3, x25      # VGA_BASE + index

    slli  x25, x25, 2       # address = index << 2
    sw    x30, 0(x25)

    addi  x23, x23, 1
    ret

# —————————————————————————————
# display_won: print centered “YOU WON :)” in green
#————————————————————————————
display_won:

    # --- build green-only color nibble ---
    addi  x28, x0, 15       # green = 0xF
    slli  x28, x28, 16      # green << 12

    # --- starting position for centered text ---
    addi  x23, x0, 17       # X = 17
    addi  x24, x0, 13       # Y = 13

    # --- print "YOU FAILED :(" ---
    addi  x30, x0, 'Y'
    jal ra, write_char
    addi  x30, x0, 'O'
    jal ra, write_char
    addi  x30, x0, 'U'
    jal ra, write_char
    addi  x30, x0, ' '
    jal ra, write_char
    addi  x30, x0, 'W'
    jal ra, write_char
    addi  x30, x0, 'O'
    jal ra, write_char
    addi  x30, x0, 'N'
    jal ra, write_char
# —————————————————————————————
# display_failed: print centered “YOU FAILED :(” in red
#————————————————————————————


display_failed:

    # --- build red‐only color nibble ---
    addi  x28, x0, 15       # red = 0xF
    slli  x28, x28, 16      # red<<16

    # --- starting position for centered text ---
    addi  x23, x0, 17       # X = 17
    addi  x24, x0, 13       # Y = 13

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

# —————————————————————————————
# game_over: halt program
#————————————————————————————
game_over:
    jal ra, main_loop # (halt)