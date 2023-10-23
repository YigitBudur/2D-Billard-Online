/// @description Insert description here

connectedPlayers = 2;
enum GAME_STATE // Used to determine if a round is being played, ended etc.
{
	WAITING_TO_START,
	SETTING_TABLE,
	PLAYING,
	ENDED
}

gameState = GAME_STATE.WAITING_TO_START; // <-- Default Starting State
global.isYourTurn = true; // used to play your turn in [oBall -> Draw Event]

global.mouseXStart = noone; // Starting point of the Ball Shooting
global.mouseYStart = noone; // Starting point of the Ball Shooting
global.mouseXEnd = noone;	// Ending point of the Ball Shooting	
global.mouseYEnd = noone;	// Ending point of the Ball Shooting	

global.redBallsINSIDE = 0;
global.yellowBallsINSIDE = 0;
global.winner = "";


