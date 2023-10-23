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

	#region Unstuck Balls
	with(instance_position(x,y,oBall))
	{
		if (id != other.id)
		{	
			var pdist = point_distance(x,y,other.x,other.y);
	
			var dir1 = point_direction(x,y, other.x,other.y); 
			var dir2 = point_direction(other.x,other.y, x,y);
	
			x = x+lengthdir_x(pdist/2,dir2);
			y = y+lengthdir_y(pdist/2,dir2);
			other.x = other.x+lengthdir_x(pdist/2,dir1);
			other.y = other.y+lengthdir_y(pdist/2,dir1);
		}
	}
	#endregion
	#region Unstuck Walls
	with(instance_position(x,y,oWalls))
	{	
		var pdist = point_distance(x,y,other.x,other.y);	
		var dir1 = point_direction(x,y, other.x,other.y); 
	
		other.x = other.x+lengthdir_x(pdist/2,dir1);
		other.y = other.y+lengthdir_y(pdist/2,dir1);
	}
	#endregion

	if (speed > 0)
	{
		image_angle += rotationSpeed;
	}	

} else {
	x = mouse_x;
	y = mouse_y;
	if (LMBr)
	{
		placed = true;	
	}
}