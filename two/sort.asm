// the riscv assembly for sort procedure
// mem addr for risc-v refers to the byte addr
// v and n are parameters x10 and x11
// x19, x20 to i,j

// swap procedure
swap:
	slli x6, x11,  3  // reg x6 = k * 8 (shift 3 is k x 8)
	add  x6, x10,  x6 //reg x6 = v + (k * 8)
	ld   x5, 0(x6)    // reg x5(temp) = x[k] 
	ld   x7  8(x6)    // reg x7 = x[k +1]
	sd   x7, 0(x6)    // v[k] = reg x7
	sd   x5, 8(x6)    // v[k+1] = reg x5 (temp)
	jalr x0, 0(x1)    // return 


// Saving Registers
sort:	addi sp, sp, -40
	sd x1,  32(sp)
	sd x22, 24(sp)
	sd x21,  16(sp)
	sd x20,  8(sp)
	sd x19,  0(sp)

// Move Parameters
	mv x21, x10
	mv x22, x11

// Outer loop
	li x19, 0
for1tst:bge x19, x11, exit1 

// Inner loop
	addi x19, x19, 1 // i += 1
for2tst:blt x20, x0, exit2 // go to exit2 if x20 < 0 (j < 0)
	slli x5, x20, 3    // reg x5 = j * 8
	add  x5, x10, x5   // reg x5 = v + (j * 8)
	ld x6, 0(x5)       // reg x6 = v[j]
	ld x7, 8(x5)       // reg x7 = v[j+1]
	ble x6, x7, exit2  // go to exit2 if x6 <= x7

//Pass parameters and call
	mv x10, x21
	mv x11, x20
	jal x1, swap

//Inner loop
	addi x20, x20, -1
	j for2tst

//Outer loop
exit2:  addi x19, x19, 1
	j for1tst

exit1:  ld x19,  0(sp)
	ld x20,  8(sp)
	ld x21,  16(sp)
	ld x22, 24(sp)
	ld x1,  32(sp)
	addi sp, sp, 40
	jalr x0, 0(x1)
