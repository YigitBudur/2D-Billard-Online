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
							
							var buffer = buffer_create(1024, buffer_fixed,1)
							buffer_seek(buffer, buffer_seek_start,0);
							
							
							var lenX = lengthdir_x(SHOT_SPEED,SHOT_ANGLE);
							var lenY = lengthdir_y(SHOT_SPEED,SHOT_ANGLE);
							show_debug_message(lenX);
							show_debug_message(lenY);
							buffer_write(buffer, buffer_u8, 1);
							buffer_write(buffer, buffer_f32, lenX);
							buffer_write(buffer, buffer_f32, lenY);
							network_send_packet(oGame.socket,buffer, buffer_get_size(buffer));
							buffer_delete(buffer);
							
							audio_play_sound(sndIstaka,1,false);
							audio_play_sound(sndBallCrash,1,false,.7);
							var PART_ANGLE = point_direction(global.mouseXStart,global.mouseYStart, global.mouseXEnd,global.mouseYEnd);
							for(var i=0; i<45; i++)
							{
								part_type_direction(global.partHit, -(PART_ANGLE+irandom_range(0,-16)), -(PART_ANGLE+irandom_range(0,16)), 0, 0);
								part_particles_create(global.sysParticles,x,y,global.partHit,1);
							}
							physics_apply_force(x,y, lenX, lenY);

							global.isYourTurn = false;
						}
						global.mouseXStart = noone;
						global.mouseYStart = noone;
					}
				}
			}
	}

}

draw_self();