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
            INTEGER,DIMENSION(:),ALLOCATABLE,INTENT(OUT):: board
            INTEGER,DIMENSION(:),ALLOCATABLE:: temp_board
            INTEGER:: choice, i, err
            CHARACTER(len=30):: filename
            20 WRITE(*,*) "Select how to read the board:"
            WRITE(*,*) "1 - Default board"
            WRITE(*,*) "2 - Define my own"
            WRITE(*,*) "3 - Read from a file"
            READ(*,*) choice

            SELECT CASE(choice)
                CASE(1)
                    board_dim = 5
                    ALLOCATE(board(5))
                    board = (/2,3,4,5,6/)
                CASE(2)
                    WRITE(*,*) "How many rows do you want on your board?"
                    READ(*,*) board_dim
                    IF(board_dim <= 0) THEN
                        WRITE(*,*) "A board must have positive dimensions! Aborting read"
                        GOTO 20
                    END IF
                    ALLOCATE(board(board_dim))
                    DO i=1, board_dim
                        WRITE(*,*) "How many items should be in row #", i,"?:"
                        READ(*,*) board(i)
                        IF(board(i) < 0) THEN
                            WRITE(*,*) "A row cannot have negative items! Aborting read."
                            GOTO 20
                        END IF
                    END DO
                CASE(3)
                    WRITE(*,*) "Please enter the name of the file to read:"
                    READ(*,*) filename
                    OPEN(UNIT=30, FILE=filename, STATUS="OLD", ACTION="READ", IOSTAT=err)
                    IF(err .NE. 0) THEN
                        WRITE(*,*) "There was an error opening the file", filename
                        GOTO 20
                        WRITE(*,*) "ERROR SHOULD NOT HAVE REACHED HERE"
                    END IF
                    ALLOCATE(temp_board(25))
                    i = 1
                    DO
                        READ(30,*,IOSTAT=err) temp_board(i)
                        IF(err .NE. 0) EXIT
                        IF(temp_board(i) < 0) THEN
                            WRITE(*,*) "Read a negative value! Aborting read"
                            DEALLOCATE(temp_board, STAT = err)
                            IF(err .NE. 0) STOP "Error deallocating memory"
                            CLOSE(30)
                            GOTO 20
                        END IF
                        i = i + 1
                    END DO
                    ALLOCATE(board(i))
                    board(1:i) = temp_board(1:i)
                    board_dim = i - 1
                    DEALLOCATE(temp_board, STAT = err)
                    IF(err .NE. 0) STOP "Error deallocating memory"

                CASE DEFAULT
                    WRITE(*,*) "That was an invalid selection."
                    GOTO 20
            END SELECT
        END SUBROUTINE
END MODULE READBOARD
