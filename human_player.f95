! Human player.
! Accepts and validates input, then updates the board.

MODULE human_player
IMPLICIT NONE
CONTAINS

FUNCTION human_player_turn(board, length)
    INTEGER :: length, row, sticks
    REAL    :: x, y
    INTEGER, DIMENSION(length) :: board, human_player_turn


    ! Make sure the row has >0 sticks left.
    DO
        WRITE(*,*) "Select the row:"
        READ(*,*) row
        IF (row .GT. 0 .AND. row .LE. length .AND. board(row) .NE. 0) EXIT
        WRITE(*,*) "Invalid row, try again."
    END DO

    ! Get the number of sticks.
    DO
        WRITE(*,*) "Select the number of sticks:"
        READ(*,*) sticks
        IF (sticks .GT. 0 .AND. sticks .LE. board(row)) EXIT
        WRITE(*,*) "Invalid number of sticks, try again."
    END DO

    ! Remove some sticks from a row.
    board(row) = board(row) - sticks

    human_player_turn = board
    RETURN
END FUNCTION human_player_turn

END MODULE human_player
