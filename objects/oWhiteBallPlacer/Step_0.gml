/// @description Insert description here
LMBr = mouse_check_button_released(mb_left);

x = mouse_x;
y = mouse_y;

if (LMBr) // Place the White Ball back
{
	if (!place_meeting(mouse_x,mouse_y,oBall))
	{		
		with(instance_create_layer(mouse_x,mouse_y,"layerBalls",oBall))
		{				
			ballType = 0; // [0 = White Ball] [1 = Black Ball] [2 = Red Ball] [3 = Yellow Ball]
			placed = true;
		}
		instance_destroy();
	}
}






