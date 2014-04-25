!  VARIABLES USED:
!    NAME:           TYPE:     COMMENT:
!dumb_player		  MODULE	module for a dumb computer player
!dumb_player_turn	  FUNCTION	function for running the computer turn
!board			  INTEGER	representation of the board	
!length			  INTEGER	number of rows in the board
!row			  INTEGER	chooses which row of sticks to choose from
!sticks			  INTEGER	chooses how many sticks to take
!x			  REAL		random row for computer choice
!y			  REAL		random number of sticks for computer choice
!-------------------------------------------------------------------------------------


! Dumb computer player.
! Makes random, valid moves.

MODULE dumb_player
IMPLICIT NONE
CONTAINS

FUNCTION dumb_player_turn(board, length)
    INTEGER :: length, row, sticks
    REAL    :: x, y
    INTEGER, DIMENSION(length) :: board, dumb_player_turn

    ! Generate two random numbers.
    CALL random_seed()
    CALL RANDOM_NUMBER(x)
    CALL RANDOM_NUMBER(y)

    ! Normalize one against the board length to get the row.
    ! Make sure the row has >0 sticks left.
    DO
        row = 1 + (INT(x * length))
	IF (board(row) .NE. 0) EXIT
	CALL RANDOM_NUMBER(x)
    END DO

    ! Normalize the other against the row width to get the number of sticks.
    sticks = 1 + INT(y * board(row))

    ! Remove some sticks from a row.
    board(row) = board(row) - sticks

    dumb_player_turn = board
    RETURN
END FUNCTION dumb_player_turn

END MODULE dumb_player
