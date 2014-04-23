!---------------------------------------------------------------------------
!  Header section:
!  TITLE: CSCI260 Final Project - Nim Game
!  AUTHORS: Kevin Carbaugh, Ryan Shipp, Estevan Trujillo
!  CLASS: CSCI260A
!  DATE WRITTEN: 4/23/14
!  LAST REVISION: 4/23/14
!  DESCRIPTION: 
!   Defines the differnt ways to read boards
!
!  DATA DICTIONAY
!--------------------------------------------------------------------------
!  VARIABLES USED:
!
!---------------------------------------------------------------------------

MODULE READBOARD
    IMPLICIT NONE
    CONTAINS
        SUBROUTINE READ_BOARD(board, board_dim)
            INTEGER,INTENT(OUT):: board_dim
            INTEGER,DIMENSION(:),allocatable,INTENT(OUT):: board
            INTEGER:: choice, i
            20 WRITE(*,*) "Select how to read the board:"
            WRITE(*,*) "1 - Default board"
            WRITE(*,*) "2 - Define my own!"
            READ(*,*) choice
            IF(choice /= 1 .AND. choice /= 2) THEN
                WRITE(*,*) "That was an invalid selection."
                GOTO 20
            END IF
            IF(choice == 1) THEN
                board_dim = 5
                ALLOCATE(board(5))
                board = (/2,3,4,5,6/)
            ELSE
                WRITE(*,*) "How many rows do you want on your board?"
                READ(*,*) board_dim
                ALLOCATE(board(board_dim))
                DO i=1, board_dim
                    WRITE(*,*) "How many items should be in row #", i,"?:"
                    READ(*,*) board(i)
                END DO
            END IF
        END SUBROUTINE
END MODULE READBOARD
