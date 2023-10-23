/// @description Insert description here

with(instance_place(x,y,oBall)) // with the collided oBall:
{	
	if (ballType == 0) // [0 = White Ball] [1 = Black Ball] [2 = Red Ball] [3 = Yellow Ball]
	{
		if (global.isYourTurn == true)
		{
			global.isYourTurn = false;		
		} else {
			with(instance_create_layer(mouse_x,mouse_y,"layerBalls",oBall))
			{
				ballType = 0; // [0 = White Ball] [1 = Black Ball] [2 = Red Ball] [3 = Yellow Ball]
				placed = false;
			}
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
	}
	
	if (ballType == 2) // [0 = White Ball] [1 = Black Ball] [2 = Red Ball] [3 = Yellow Ball]
	{
		global.redBallsINSIDE++;	
	}
	
	if (ballType == 3) // [0 = White Ball] [1 = Black Ball] [2 = Red Ball] [3 = Yellow Ball]
	{
		global.yellowBallsINSIDE++;	
	}
	instance_destroy();
}







