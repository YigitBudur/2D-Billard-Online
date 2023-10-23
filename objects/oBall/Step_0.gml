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
	if (speed > 0)
	{
		image_angle += speed*2;
	}

} else {
	x = mouse_x;
	y = mouse_y;
	if (LMBr)
	{
		placed = true;	
	}
}