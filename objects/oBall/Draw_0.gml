/// @description Insert description here

#region Key Checks [CTRL+M to close]
LMBp = mouse_check_button_pressed(mb_left);
LMBh = mouse_check_button(mb_left);
LMBr = mouse_check_button_released(mb_left);

RMBr = mouse_check_button_released(mb_right);
#endregion

if (global.isYourTurn == true)
{	
	if (ballType == 0)
	{
		if (RMBr)
		{
			LMBp = false;
			LMBh = false;
			LMBr = false;
			global.mouseXStart = noone;	
			global.mouseYStart = noone;
			global.mouseXEnd = noone;	
			global.mouseYEnd = noone;	
		}
		else 
		{
				if (LMBp && point_in_circle(mouse_x,mouse_y,x,y,4)) // [PRESS] to start setting a Shot Direction
				{
					global.mouseXStart = mouse_x;	
					global.mouseYStart = mouse_y;
				}
				if (LMBh) // [HOLD] to set a Direction to Shoot
				{
					global.mouseXEnd = mouse_x;	
					global.mouseYEnd = mouse_y;
					if (global.mouseXStart != noone)
					{													
						var SHOT_ANGLE = point_direction(global.mouseXEnd,global.mouseYEnd, global.mouseXStart,global.mouseYStart);
						var PULL_DIST = point_distance(global.mouseXEnd,global.mouseYEnd, global.mouseXStart,global.mouseYStart);
						PULL_DIST = clamp(PULL_DIST,6,88);
						if (PULL_DIST >= 6)
						{
							draw_arrow(x-1,y-1,x+lengthdir_x(PULL_DIST,SHOT_ANGLE),y+lengthdir_y(PULL_DIST,SHOT_ANGLE),12);
							draw_sprite(sBlueDot,0,mouse_x,mouse_y);
						}
					}
				}
				if (LMBr) // Set the Shot Direction [FROM release x,y TO START x,y]
				{
					if (global.mouseXStart != noone)
					{	
						var SHOT_ANGLE = point_direction(global.mouseXEnd,global.mouseYEnd, global.mouseXStart,global.mouseYStart);
						direction = SHOT_ANGLE;
						
						var PULL_DIST = point_distance(global.mouseXEnd,global.mouseYEnd, global.mouseXStart,global.mouseYStart);
						if (PULL_DIST >= 6)
						{
							var SHOT_SPEED = clamp(PULL_DIST,6,88);
							if (SHOT_SPEED)
							speed = SHOT_SPEED/7.8;

							global.isYourTurn = false;
						}
					}
				}
			}
	}

}

draw_self();