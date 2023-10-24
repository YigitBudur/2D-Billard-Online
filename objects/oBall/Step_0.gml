/// @description Insert description here
image_index = ballType;
#region Key Checks [CTRL+M to close]
LMBp = mouse_check_button_pressed(mb_left);
LMBh = mouse_check_button(mb_left);
LMBr = mouse_check_button_released(mb_left);

RMBr = mouse_check_button_released(mb_right);
#endregion

if (placed == true)
{
	

} else {
	phy_position_x = mouse_x;
	phy_position_y = mouse_y;
	if (LMBr)
	{
		placed = true;	
	}
}

if (phy_speed < .2)
{
	phy_speed_x = 0;
	phy_speed_y = 0;
}