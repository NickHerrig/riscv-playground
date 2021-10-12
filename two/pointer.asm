       mv x5, x10
loop2: sd x0, 0(x5) 
       addi x5, x5, 8 
       slli x6, x11, 3
       add x7, x10, x6
       btu x5, x7, loop2
