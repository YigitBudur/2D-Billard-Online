/// @description Insert description here


if (connectedPlayers == 2)
{
	if (gameState == GAME_STATE.WAITING_TO_START)
	{
		gameState = GAME_STATE.SETTING_TABLE;	
	}
	
    if (gameState == GAME_STATE.SETTING_TABLE)
	{
		var whiteBallX = room_width/3;
		var whiteBallY = room_height/2;					
		with(instance_create_layer(whiteBallX,whiteBallY,"layerBalls",oBall))
		{
			ballType = 0; // [0 = White Ball] [1 = Black Ball] [2 = Red Ball] [3 = Yellow Ball]
		}
							
		gameState = GAME_STATE.PLAYING;		
	}
	
	if (gameState == GAME_STATE.ENDED)
	{
		alarm_set(0,60*10);
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