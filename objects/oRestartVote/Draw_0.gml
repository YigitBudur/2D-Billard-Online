/// @description Insert description here


draw_self();


draw_set_color(c_black);
draw_set_font(fntBig);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (restartVoteSent == false)
{
	draw_text(x+sprite_width/2,y+sprite_height/2-4,"[Vote Restart]");
} else { draw_text(x+sprite_width/2,y+sprite_height/2-4,"[Voted for Restart]"); }

draw_set_font(fntDefault);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);








