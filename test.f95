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

PROGRAM nim_tests
    IMPLICIT NONE

    BOOLEAN, DIMENSION(5,5) :: board

    ! tests
    assert("dumb_player_turn changes board", board != dumb_player_turn(board))


CONTAINS

SUBROUTINE set_up(board)
    BOOLEAN, INTENT(INOUT) :: board
    DIMENSION board(5,5)
    board(1) = (/ .TRUE., .FALSE., .FALSE., .FALSE., .FALSE. /)
    board(2) = (/ .TRUE., .TRUE., .TRUE., .FALSE., .FALSE. /)
    board(3) = (/ .TRUE., .TRUE., .TRUE., .TRUE., .FALSE. /)
    board(4) = (/ .TRUE., .TRUE., .TRUE., .TRUE., .TRUE. /)
    board(5) = (/ .FALSE., .FALSE., .FALSE., .FALSE., .FALSE. /)
END

FUNCTION assert(message, assertion)
    LOGICAL assert
    WRITE(*,*) "Test", message
    IF (assertion .EQ. .TRUE.) THEN
        WRITE(*,*) "Passed"
	assert = .TRUE.
    ELSE
        WRITE(*,*) "Failed"
	assert = .FALSE.
	STOP
    END IF
    RETURN
END

END PROGRAM
