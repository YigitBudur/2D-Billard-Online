/// @description Insert description here


if (connectedPlayers == 1 && room == rmGame)
{
	if (gameState == GAME_STATE.WAITING_TO_START)
	{
		global.redBallsINSIDE = 0;
		global.yellowBallsINSIDE = 0;
		global.winner = "";
		gameState = GAME_STATE.SETTING_TABLE;
	}
	
    if (gameState == GAME_STATE.SETTING_TABLE)
	{
		var whiteBallX = room_width/3;
		var whiteBallY = room_height/2;
		
		// Colored Balls
		for (var i=0; i<14; i++)
		{
			with(instance_create_layer(ballsX[i],ballsY[i],"layerBalls",oBall))
			{
				ballType = other.arrBallTypes[i]; //3; // [0 = White Ball] [1 = Black Ball] [2 = Red Ball] [3 = Yellow Ball]		
			}			
			//show_debug_message(other.arrBallTypes[i]);
		}
		
		// White Ball
		with(instance_create_layer(whiteBallX,whiteBallY,"layerBalls",oBall))
		{
			ballType = 0; // [0 = White Ball] [1 = Black Ball] [2 = Red Ball] [3 = Yellow Ball]
		}
		
		// Black Ball
		with(instance_create_layer(1305,539,"layerBalls",oBall))
		{
			ballType = 1; // [0 = White Ball] [1 = Black Ball] [2 = Red Ball] [3 = Yellow Ball]
		}
		gameState = GAME_STATE.PLAYING;		
	}
	
	if (gameState == GAME_STATE.ENDED)
	{
		if (alarm_get(0) <= 0)
		{
			alarm_set(0,60*10);
		}
	}
	
	//if (mouse_check_button_pressed(mb_middle))
	//{
	//	with(instance_create_layer(mouse_x,mouse_y,"layerBalls",oBall))
	//	{
	//		ballType = choose(2,3); // [0 = White Ball] [1 = Black Ball] [2 = Red Ball] [3 = Yellow Ball]
	//	}
	//}
}


//if window_get_fullscreen()
//{
//	// Fullscreen is ON
//	var displayWidth = display_get_width();
//	var displayHeight = display_get_height();
	
//	window_set_size(displayWidth,displayHeight);
//}
//else
//{

//    // Fullscreen is OFF
//	var displayWidth = display_get_width();
//	var displayHeight = display_get_height();
	
//	window_set_size(displayWidth*(3/4),displayHeight*(3/4));
//}