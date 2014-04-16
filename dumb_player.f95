!---------------------------------------------------------------------------
!  Header section:
!  TITLE: CSCI260 Final Project - Nim Game
!  AUTHORS: Kevin Carbaugh, Ryan Shipp
!  CLASS: CSCI260A
!  DATE WRITTEN: 4/11/14
!  LAST REVISION: 4/11/14
!  DESCRIPTION: This program allows users to play the game 'Nim'
!               either against an AI or another human
!
!  DATA DICTIONAY
!--------------------------------------------------------------------------
!  VARIABLES USED:
!       NAME:           TYPE:           COMMENT:
!
!
!
!---------------------------------------------------------------------------

MODULE dumb_player
IMPLICIT NONE
CONTAINS
    FUNCTION dumb_player_turn(board)


        dumb_player_turn = board
        RETURN
    END FUNCTION dumb_player_turn
END MODULE dumb_player
