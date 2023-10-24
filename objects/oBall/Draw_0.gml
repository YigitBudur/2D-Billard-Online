/// @description Insert description here


#region Unstuck Balls
//with(instance_place(x,y,oBall))
//{
//	if (id != other.id)
//	{			
//		var pdist = point_distance(x,y,other.x,other.y);
//		var dir1 = point_direction(x,y, other.x,other.y); 
//		var dir2 = point_direction(other.x,other.y, x,y);
//		x = x+lengthdir_x(pdist/12,dir2);
//		y = y+lengthdir_y(pdist/12,dir2);
//		other.x = other.x+lengthdir_x(pdist/12,dir1);
//		other.y = other.y+lengthdir_y(pdist/12,dir1);
				
//		//show_debug_message("collision");		
//		//show_debug_message("pdist="+string(pdist));		
//		//draw_line(x,y,x+lengthdir_x(pdist/2,dir1),y+lengthdir_y(pdist/2,dir1));					
//		//show_debug_message("current= "+string(x)+","+string(y));
//		//show_debug_message("other= "+string(other.x)+","+string(other.y));		
//	}
//}
#endregion
	
#region Unstuck Walls
//with(instance_place(x,y,oWalls))
//{	
//	var pdist = point_distance(x,y,other.x,other.y);	
//	var dir1 = point_direction(x,y, other.x,other.y); 
	
//	other.x = other.x+lengthdir_x(pdist/12,dir1);
//	other.y = other.y+lengthdir_y(pdist/12,dir1);
//}
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
				if (phy_speed <= 0)
				{
					draw_set_color(c_green);
					draw_triangle(x-24,y-56, x,y-36, x+24,y-56, false);	
					draw_set_color(c_white);
					show_debug_message(">> STOPPED SPEED="+string(phy_speed));
				} //else show_debug_message(">> SPEED="+string(speed));
				if (LMBp && point_in_circle(mouse_x,mouse_y,x,y,24) && phy_speed <= 0) // [PRESS] to start setting a Shot Direction
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
							var SHOT_SPEED = lerp(50,3000,clampDIST/400);
							show_debug_message(SHOT_SPEED);
							
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