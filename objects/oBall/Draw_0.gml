/// @description Insert description here

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
				global.ballSpeedTotal = 0;
				with(oBall)
				{
					if (bindFixture == true)
					{
						global.ballSpeedTotal += phy_speed;
					}
				}
				
				if (global.ballSpeedTotal <= 0)
				{
					draw_set_color(c_aqua);
					draw_triangle(x-24,y-56, x,y-36, x+24,y-56, false);	
					draw_set_color(c_white);
				}
				if (LMBp && point_in_circle(mouse_x,mouse_y,x,y,24) && global.ballSpeedTotal <= 0) // [PRESS] to start setting a Shot Direction
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
						PULL_DIST = clamp(PULL_DIST,32,400);
						if (PULL_DIST >= 32)
						{
							draw_arrow(x-1,y-1,x+lengthdir_x(PULL_DIST,SHOT_ANGLE),y+lengthdir_y(PULL_DIST,SHOT_ANGLE),24);
							draw_sprite_ext(sBallCue,0,x-lengthdir_x(PULL_DIST/5,SHOT_ANGLE),y-lengthdir_y(PULL_DIST/5,SHOT_ANGLE),1,1,SHOT_ANGLE,c_white,1);
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
						if (PULL_DIST >= 32)
						{
							//lerp(48,700);
							var clampDIST = clamp(PULL_DIST,32,400);
							var SHOT_SPEED = lerp(25,3000,clampDIST/400);
							//show_debug_message(SHOT_SPEED);
							
							var lenX = lengthdir_x(SHOT_SPEED,SHOT_ANGLE);
							var lenY = lengthdir_y(SHOT_SPEED,SHOT_ANGLE);
							
							physics_apply_force(x,y, lenX, lenY);
							//speed = SHOT_SPEED/7.6;

							//global.isYourTurn = false;
						}
						global.mouseXStart = noone;
						global.mouseYStart = noone;
					}
				}
			}
	}

}

draw_self();