! Dumb computer player.
! Makes random, valid moves.

MODULE dumb_player
IMPLICIT NONE
CONTAINS

FUNCTION dumb_player_turn(board, length)
    INTEGER :: length
    INTEGER, DIMENSION(length) :: board, dumb_player_turn

    dumb_player_turn = board
    RETURN
END FUNCTION dumb_player_turn

END MODULE dumb_player
