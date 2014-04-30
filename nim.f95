!---------------------------------------------------------------------------
!  Header section:
!  TITLE: CSCI260 Final Project - Nim Game
!  AUTHORS: Kevin Carbaugh, Ryan Shipp, Estevan Trujillo
!           kcarbaug@mines.edu, rshipp@mines.edu, etrujill@mines.edu
!  CLASS: CSCI260A
!  DATE WRITTEN: 4/11/14
!  LAST REVISION: 4/25/14
!  DESCRIPTION: This program allows users to play the game 'Nim'
!               either against an AI or another human
!
!  DATA DICTIONAY
!--------------------------------------------------------------------------
!  VARIABLES USED:
!       NAME:           TYPE:           COMMENT:
!       menu_choice     INTEGER         The user's menu selection
!       board_dim       INTEGER         the number of rows in the board
!       err             INTEGER         used for return codes
!       turn            INTEGER         A counter of the number of turns
!       board           INTEGER array   the representation of the board
!       game_won        LOGICAL         detects victory condition
!       i               INTEGER         loop counter
!---------------------------------------------------------------------------

!Modules
INCLUDE "print_board.f95"
INCLUDE "dumb_player.f95"
INCLUDE "human_player.f95"
INCLUDE "board_reader.f95"

PROGRAM NIM
    USE PRINTBOARD
    USE READBOARD
    USE dumb_player
    USE human_player
    IMPLICIT NONE
    INTEGER:: menu_choice, board_dim, err, turn
    INTEGER,DIMENSION(:),allocatable:: board
    10 WRITE(*,*) "Welcome to the game of nim. Please select an option:"
    WRITE(*,*) "1 - Play vs another human"
    WRITE(*,*) "2 - Play vs an AI"
    WRITE(*,*) "3 - How to play"
    READ(*,*) menu_choice
    turn = 0

    SELECT CASE(menu_choice)
        CASE(1)
            CALL READ_BOARD(board, board_dim)
            CALL PRINT_BOARD(board, board_dim)
            DO
                IF (MOD(turn, 2) .EQ. 0) THEN
                    WRITE(*,*) ""
                    WRITE(*,*) "Player 1's turn:"
                    board = human_player_turn(board, board_dim)
                    CALL PRINT_BOARD(board, board_dim)
                    IF (game_won(board, board_dim)) THEN
                        WRITE(*,*) "Player 2 won."
                        STOP
                    END IF
                ELSE
                    WRITE(*,*) ""
                    WRITE(*,*) "Player 2's turn:"
                    board = human_player_turn(board, board_dim)
                    CALL PRINT_BOARD(board, board_dim)
                    IF (game_won(board, board_dim)) THEN
                        WRITE(*,*) "Player 1 won."
                        STOP
                    END IF
                END IF
                turn = turn + 1
            END DO 
        CASE(2)
            CALL READ_BOARD(board, board_dim)
            CALL PRINT_BOARD(board, board_dim)
            DO
                IF (MOD(turn, 2) .EQ. 0) THEN
                    board = human_player_turn(board, board_dim)
                    CALL PRINT_BOARD(board, board_dim)
                    IF (game_won(board, board_dim)) THEN
                        WRITE(*,*) "Computer player won."
                        STOP
                    END IF
                ELSE
                    WRITE(*,*) "Computer player's turn:"
                    board = dumb_player_turn(board, board_dim)
                    CALL PRINT_BOARD(board, board_dim)
                    IF (game_won(board, board_dim)) THEN
                        WRITE(*,*) "Human player won."
                        STOP
                    END IF
                END IF
                turn = turn + 1
            END DO
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


    DEALLOCATE(board, STAT = err)
    IF(err .NE. 0) STOP "Error deallocating memory"


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

