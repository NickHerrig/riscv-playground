li x5, 0
loop1: slli x6, x5, 3
       add x7, x10, x6
       sd x0, 0(x7) 
       addi x5, x5, 1
       blt x5, x11, loop1
