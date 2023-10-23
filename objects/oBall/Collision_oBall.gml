/// @description Insert description here


var dir1 = point_direction(x,y, other.x,other.y); 
var dir2 = point_direction(other.x,other.y, x,y);
	
direction = dir2;
other.direction = dir1;
//move_bounce_solid(true);

var totalSpeed = (other.speed+speed);


other.speed = totalSpeed*.5;
speed = totalSpeed*.5;



show_debug_message(speed);
show_debug_message(other.speed);


