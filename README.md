# CHIP-8 Emulator

This project was implemented by Gaël Gilet--Couraud, Lucien Ricimello, Maxime
Gaudron and Guillaume Doré.
It is entirely coded using the ADA language and the GPS IDE. It has been made
to run on STM32F4-Discovery boards.

The main goal of this project is to implement a emulator for the CHIP-8
architecture as described
[here](http://devernay.free.fr/hacks/chip8/C8TECH10.HTM).

In order to by-pass the lack of a proper file system on the board, we chose to
include the rom into the source code.

The four main parts of the project are the implementation of the architecture
of the CHIP-8, the implementation of the instruction set, the graphical user
interface and the tests and rom loader.
