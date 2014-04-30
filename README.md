FORTRAN-Nim
===========

This is an implementation of the Nim game in Fortran. For more
information about Nim, see http://www.archimedes-lab.org/game_nim/nim.html.

## Usage

The program compiles with g95 and gfortran. Instructions for both are
the same, so substitute your preferred compiler in the commands below.

    g95 nim.f95 -o nim

Running the game is as simple as

    ./nim
    
##Files

For text files specifying game boards, the format is one integer per line to
specify the number of items in a row, top to bottom
