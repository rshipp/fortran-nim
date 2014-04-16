!PrintBoard subroutine
!Accepts an array of integers representing the number
!Of matches left in each row and prints out a number of | characters
!It will attempt to format it like a pyramid

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
        WRITE(*,*) row
    END DO
END SUBROUTINE
