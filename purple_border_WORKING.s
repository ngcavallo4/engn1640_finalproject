    # 1) Compute VGA base in x3 (words→bytes)
    addi x3 x0 2047
    addi x3 x3 1 	     # VGA base word index

    # Purple "="
    addi x30, x0, 14     # nibble = 0xE3B
    slli x30, x30, 4
    addi x30, x30, 3
    slli x30, x30, 4
    addi x30, x30, 11
    slli x30, x30, 8
    addi x30, x30, 61     # ASCII ‘=’

    #──────────────────────────────────────────────────────────────
    # Top border:    Y=0, X=0…47
    #──────────────────────────────────────────────────────────────
    li   x8, 0           # y = 0
    li   x7, 0           # x = 0
    li   x12, 48         # sentinel = 48
top_loop:
    slli x9, x7, 5       # x9 = x * 32
    add  x9, x9, x8      # x9 = x*32 + y
    add  x14, x3, x9     # word address = base + index
    slli x14, x14, 2     # byte address
    sw   x30, 0(x14)

    addi x7, x7, 1
    bne  x7, x12, top_loop

    #──────────────────────────────────────────────────────────────
    # Right border:  X=47, Y=0…26
    #──────────────────────────────────────────────────────────────
    li   x7, 47          # x = 47
    li   x8, 0           # y = 0
    li   x12, 27         # sentinel = 27
right_loop:
    slli x9, x7, 5
    add  x9, x9, x8
    add  x14, x3, x9
    slli x14, x14, 2
    sw   x30, 0(x14)

    addi x8, x8, 1
    bne  x8, x12, right_loop

    #──────────────────────────────────────────────────────────────
    # Bottom border: Y=26, X=0…47
    #──────────────────────────────────────────────────────────────
    li   x8, 26          # y = 26
    li   x7, 0           # x = 0
    li   x12, 48         # sentinel = 48
bottom_loop:
    slli x9, x7, 5
    add  x9, x9, x8
    add  x14, x3, x9
    slli x14, x14, 2
    sw   x30, 0(x14)

    addi x7, x7, 1
    bne  x7, x12, bottom_loop

    #──────────────────────────────────────────────────────────────
    # Left border:   X=0, Y=0…26
    #──────────────────────────────────────────────────────────────
    li   x7, 0           # x = 0
    li   x8, 0           # y = 0
    li   x12, 27         # sentinel = 27
left_loop:
    slli x9, x7, 5
    add  x9, x9, x8
    add  x14, x3, x9
    slli x14, x14, 2
    sw   x30, 0(x14)

    addi x8, x8, 1
    bne  x8, x12, left_loop

    # ── Frame complete ───────────────────────────────────────────

