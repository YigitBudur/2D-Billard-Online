/// @description Insert description here


var dir1 = point_direction(x,y, other.x,other.y); 
var dir2 = point_direction(other.x,other.y, x,y);
	
direction = dir2;
other.direction = dir1;
move_bounce_solid(true);


other.speed = speed/1.25;	
speed = other.speed;





