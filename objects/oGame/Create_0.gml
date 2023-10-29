/// @description Insert description here


connectedPlayers = 0;
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

#region Particles
global.sysParticles = part_system_create_layer("layerParticles", false);

global.partHit = part_type_create();
part_type_alpha2(global.partHit, 1, 0);
part_type_sprite(global.partHit, s2x2White, false, false, false);
part_type_life(global.partHit, 35, 55);
part_type_size(global.partHit, .75, 1.25, -.00075, 0);
part_type_gravity(global.partHit, 0, 0);
part_type_orientation(global.partHit, 0, 0, 0, 0, 0);
part_type_direction(global.partHit, 0, 360, 0, 0);
part_type_speed(global.partHit, 6, 25, -.5, false);
part_type_blend(global.partHit, false);
#endregion

//arrBallTypes = array_create(14);
arrBallTypes = [ 3,3,3,3,3,3,3 , 2,2,2,2,2,2,2 ];
arrBallTypes = array_shuffle(arrBallTypes);

ballsX = [1212, 1257,1257, 1305,1305, 1351,1351,1351,1351, 1400,1400,1400,1400,1400];
ballsY = [542, 513,565, 486,592, 459,515,568,618, 435,486,542,594,647];