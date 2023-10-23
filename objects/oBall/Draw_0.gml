/// @description Insert description here


#region Unstuck Balls
with(instance_place(x,y,oBall))
{
	if (id != other.id)
	{	
		show_debug_message("collision");
		var pdist = point_distance(x,y,other.x,other.y);
		show_debug_message("pdist="+string(pdist));
		var dir1 = point_direction(x,y, other.x,other.y); 
		var dir2 = point_direction(other.x,other.y, x,y);
	
		//draw_line(x,y,x+lengthdir_x(pdist/2,dir1),y+lengthdir_y(pdist/2,dir1));
			
		x = x+lengthdir_x(pdist/12,dir2);
		y = y+lengthdir_y(pdist/12,dir2);
		other.x = other.x+lengthdir_x(pdist/12,dir1);
		other.y = other.y+lengthdir_y(pdist/12,dir1);
			
		show_debug_message("current= "+string(x)+","+string(y));
		show_debug_message("other= "+string(other.x)+","+string(other.y));
		
		
	}
}
#endregion
	
#region Unstuck Walls
with(instance_place(x,y,oWalls))
{	
	var pdist = point_distance(x,y,other.x,other.y);	
	var dir1 = point_direction(x,y, other.x,other.y); 
	
	other.x = other.x+lengthdir_x(pdist/12,dir1);
	other.y = other.y+lengthdir_y(pdist/12,dir1);
}
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
				if (LMBp && point_in_circle(mouse_x,mouse_y,x,y,6) && speed <= 0) // [PRESS] to start setting a Shot Direction
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
						PULL_DIST = clamp(PULL_DIST,6,66);
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
							var SHOT_SPEED = clamp(PULL_DIST,6,66);
							if (SHOT_SPEED)
							speed = SHOT_SPEED/7.6;

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