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

global.ballSpeedTotal = 0;

global.fixCANTMOVE = physics_fixture_create();
physics_fixture_set_circle_shape(global.fixCANTMOVE, 24);
physics_fixture_set_density(global.fixCANTMOVE, 0.0);
physics_fixture_set_restitution(global.fixCANTMOVE, 1.0);
physics_fixture_set_collision_group(global.fixCANTMOVE, 1);
physics_fixture_set_linear_damping(global.fixCANTMOVE, 0.9);
physics_fixture_set_angular_damping(global.fixCANTMOVE, 0.7);
physics_fixture_set_friction(global.fixCANTMOVE, 5);


global.fixMOVE = physics_fixture_create();
physics_fixture_set_circle_shape(global.fixMOVE, 24);
physics_fixture_set_density(global.fixMOVE, 1.0);
physics_fixture_set_restitution(global.fixMOVE, 1.0);
physics_fixture_set_collision_group(global.fixMOVE, 1);
physics_fixture_set_linear_damping(global.fixMOVE, 0.9);
physics_fixture_set_angular_damping(global.fixMOVE, 0.7);
physics_fixture_set_friction(global.fixCANTMOVE, 5);