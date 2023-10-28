/// @description Insert description here

with(instance_place(x,y,oBall)) // with the collided oBall:
{	
	if (ballType == 0 && placed == true) // [0 = White Ball] [1 = Black Ball] [2 = Red Ball] [3 = Yellow Ball]
	{
		if (global.isYourTurn == false)
		{
			//global.isYourTurn = false;
			instance_destroy();
			instance_create_layer(mouse_x,mouse_y,"layerWalls",oWhiteBallPlacer);									
		}
		
		
	}
	
	if (ballType == 1) // [0 = White Ball] [1 = Black Ball] [2 = Red Ball] [3 = Yellow Ball]
	{
		oGame.gameState = GAME_STATE.ENDED;
		if (global.redBallsINSIDE == 7)
		{
			global.winner = "RED";	
		} else
		if (global.yellowBallsINSIDE == 7)
		{
			global.winner = "YELLOW";	
		} else
			{
				if (global.isYourTurn == true)
				{
					global.winner = "OPPONENT";
				} else { global.winner = "YOU"; }
			}
		instance_destroy();
	}
	
	if (ballType == 2) // [0 = White Ball] [1 = Black Ball] [2 = Red Ball] [3 = Yellow Ball]
	{
		global.redBallsINSIDE++;
		instance_destroy();
	}
	
	if (ballType == 3) // [0 = White Ball] [1 = Black Ball] [2 = Red Ball] [3 = Yellow Ball]
	{
		global.yellowBallsINSIDE++;
		instance_destroy();
	}
	
}







