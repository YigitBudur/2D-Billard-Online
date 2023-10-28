/// @description Insert description here
// You can write your code in this editor

draw_self();

draw_set_color(c_black);
draw_set_font(fntBig);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x+sprite_width/2,y+sprite_height/2,buttonName);

draw_set_font(fntDefault);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

