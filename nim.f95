!---------------------------------------------------------------------------
!  Header section:
!  TITLE: CSCI260 Final Project - Nim Game
!  AUTHORS: Kevin Carbaugh, Ryan Shipp, Estevan Trujillo
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

!Modules
INCLUDE "print_board.f95"
INCLUDE "dumb_player.f95"
INCLUDE "human_player.f95"
INCLUDE "board_reader.f95"

PROGRAM NIM
    USE PRINTBOARD
    IMPLICIT NONE
    INTEGER:: menu_choice
    10 WRITE(*,*) "Welcome to the game of nim. Please select an option:"
    WRITE(*,*) "1 - Play vs another human"
    WRITE(*,*) "2 - Play vs an AI"
    WRITE(*,*) "3 - How to play"
    READ(*,*) menu_choice

    SELECT CASE(menu_choice)
        CASE(1)
            !TODO
        CASE(2)
            !TODO
        CASE(3)
            WRITE(*,*) "Nim is a game of strategy in which two players take turns picking up objects."
            WRITE(*,*) "In our case, these are represented by pipe characters (|). On their turn, a"
            WRITE(*,*) "player can take any number of objects from a single row. The object of the"
            WRITE(*,*) "game is to force your opponent to pick up the last remaining object."
            GOTO 10
        CASE DEFAULT
            WRITE(*,*) "That is not a valid choice. Please try again."
            GOTO 10
    END SELECT


CONTAINS

FUNCTION game_won(board, length)
    LOGICAL :: game_won
    INTEGER :: length, i
    INTEGER, DIMENSION(length) :: board

    game_won = .TRUE.
    DO i = 1, length
        IF (board(i) .NE. 0) THEN
            game_won = .FALSE.
	END IF
    END DO

    RETURN
END FUNCTION
END PROGRAM

