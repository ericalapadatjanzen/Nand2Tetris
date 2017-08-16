// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)



// set index to 1

    @i
    M=1

//set R2 to 0

    @2
    M=0

(LOOP)

    @0
    D=M   // D=R0\
    @END
    D;JLE  // if D = 0 goto END


    @1
    D=M  // D=R1
    @END
    D;JLE  // if D = 0 goto END

    @i
    D=M  // D=i

    @1
    D=D-M  // D = i - R1
    @END
    D;JGT  // if (i - r1) > 0 goto END


    @0
    D=M  // D = R0

    @2
    M=D+M  // R2 = R0 + R2

    @i
    M=M+1  // i = i + 1
    @LOOP
    0;JMP  // Keep LOOOOOOOOPING

(END)
    @END
    0;JMP