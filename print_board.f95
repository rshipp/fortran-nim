!---------------------------------------------------------------------------
!  Header section:
!  TITLE: CSCI260 Final Project - Nim Game
!  AUTHORS: Kevin Carbaugh, Ryan Shipp, Estevan Trujillo
!  CLASS: CSCI260A
!  DATE WRITTEN: 4/11/14
!  LAST REVISION: 4/18/14
!  DESCRIPTION: 
!    Accepts an array of integers representing the number
!    Of matches left in each row and prints out a number of | characters
!    It will attempt to format it like a pyramid
!
!  DATA DICTIONAY
!--------------------------------------------------------------------------
!  VARIABLES USED:
!       NAME:           TYPE:           COMMENT:
!       board           INTEGER ARRAY   The representation of the game board
!       board_dim       INTEGER         The size of the array
!       n               INTEGER         loop counter
!       x               INTEGER         loop counter
!
!---------------------------------------------------------------------------

MODULE PRINTBOARD
    IMPLICIT NONE
    CONTAINS
    SUBROUTINE PRINT_BOARD(board, board_dim)

        INTEGER,DIMENSION(board_dim),INTENT(IN):: board
        INTEGER,INTENT(IN):: board_dim
        INTEGER:: n,x
        CHARACTER(len=20):: row
        WRITE(*,*) "Current board"
        WRITE(*,*) "-------------"
        DO n=1,board_dim
            row = ""
            !Generate a format string for this row
            DO x=1,board(n)
                row(x:x) = '|'
            END DO
            WRITE(*,*) n,"- ",row
        END DO
    END SUBROUTINE
END MODULE PRINTBOARD
