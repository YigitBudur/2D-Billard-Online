/// @description Insert description here
image_index = ballType;
show_debug_message(image_index);
#region Key Checks [CTRL+M to close]
LMBp = mouse_check_button_pressed(mb_left);
LMBh = mouse_check_button(mb_left);
LMBr = mouse_check_button_released(mb_left);

RMBr = mouse_check_button_released(mb_right);
#endregion


if (bindFixture == false)
{
	if (ballType == 0)
	{
		physics_fixture_bind(global.fixMOVE, self);	
	} else physics_fixture_bind(global.fixMOVE, self);		
	bindFixture = true;
}


//if (collision_circle(x,y,24,oBall,true,true) && playedSound == false)
//{	
//	audio_play_sound(sndBallCrash,1,false,.7);
//	playedSound = true;
	
//} else { playedSound = false; }

//if (!collision_circle(x,y,24,oBall,true,true) && playedSound == true)
//{
//	playedSound = false;
//}

//if (placed == true)
//{
	

//} else {
//	phy_position_x = mouse_x;
//	phy_position_y = mouse_y;
//	if (LMBr)
//	{
//		placed = true;
//	}
//}

if (phy_speed < .15) // Stop the ball
{
	phy_speed_x = 0;
	phy_speed_y = 0;
	phy_angular_velocity = 0;
}