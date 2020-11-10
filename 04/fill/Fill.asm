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

  // Put your code here:
  (MAIN)
  @SCREEN
  D=A
  @SCREEN_PTR
  M=D-1
  @24576
  D=M
  @ascii
  M=D
  @4096
  D=A
  @idx
  M=D+1

  @ascii
  D=M

  @BLACK
  D                             ;JNE
  @WHITE
  0                             ;JMP

  (FILL)
  @idx
  M=M-1
  D=M
  @NEXT
  D                             ;JEQ
  @color
  D=M
  @SCREEN_PTR
  M=M+1
  A=M
  M=D
  @FILL
  0                             ;JMP

  (BLACK)
  @color
  M=-1
  @FILL
  0                             ;JMP
  (WHITE)
  M=0
  @FILL
  0                             ;JMP

  (NEXT)
  @SCREEN_ORIGINAL
  D=M
  @SCREEN
  M=D
  @MAIN
  0                             ;JMP
