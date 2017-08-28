// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.





(START)
  @colour
  M=0 //colour value is 0
(RESET)
    @KBD //keyboard memory map location RAM[24576]
    D=M // D = keyboard (R24576) is value of 0 unless 1 if key pressed
    @WHITE
    D;JEQ // no key pressed, screen to go white
    @BLACK
    D;JGT //key pressed, screen to go black
(BLACK)
    @colour
    M=0 //set colour value to 0
    @colour
    D=M
    @SCREEN
    A=A+D
    M=-1 //fill black
    @FILL
    0;JMP //goto fill
(WHITE)
    @colour
    D=M
    @SCREEN
    A=A+D
    M=0
(FILL)


    @SCREEN
    D = M

    @KBD
    D = A - D //  24576 - 16385

    @START
    D;JEQ // goto start if D = 0
    @RESET
    0;JMP //goto reset


   // @16384
   // D = M  // D = R16384
    // D = D + 1 // D = R16385
   // @24757
   // D=M // D = 24757
   // @add
    //@row
    //M=255
    //8160
    //@colum
    //M=511
    //32
     // screen start RAM[16384]
     // screen end RAM[24757]
     // 8192 words of memory each screen word controls 16 pixels