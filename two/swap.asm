// the riscv assembly for swap procedure
// use x10 to x17 for param passing
// mem addr for risc-v refers to the byte addr

swap:
    slli x6, x11,  3  // reg x6 = k * 8 (shift 3 is k x 8)
    add  x6, x10,  x6 //reg x6 = v + (k * 8)
    ld   x5, 0(x6)    // reg x5(temp) = x[k] 
    ld   x7  8(x6)    // reg x7 = x[k +1]
    sd   x7, 0(x6)    // v[k] = reg x7
    sd   x5, 8(x6)    // v[k+1] = reg x5 (temp)
    jalr x0, 0(x1)    // return 
