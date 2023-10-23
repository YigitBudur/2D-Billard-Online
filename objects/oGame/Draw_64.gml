/// @description Insert description here
draw_set_halign(fa_left);
draw_text(20,40,"FPS: "+string(floor(fps_real)));

var guiWidth = display_get_gui_width();
var guiHeight = display_get_gui_height();

draw_set_halign(fa_center);
draw_text(guiWidth/2,20,"RED BALLS INSIDE: " + string(global.redBallsINSIDE));
draw_text(guiWidth/2,40,"YELLOW BALLS INSIDE: " + string(global.yellowBallsINSIDE));

draw_set_halign(fa_left);
if (gameState == 0)
{
	draw_text(20,20,"WAITING TO START");
}
if (gameState == 1)
{
	draw_text(20,20,"SETTING TABLE");
}
if (gameState == 2)
{
	draw_text(20,20,"PLAYING");
}
if (gameState == 3)
{
	draw_text(20,20,"ENDED");
	draw_text(guiWidth/2,guiHeight,global.winner + " HAS WON");
}

draw_set_halign(fa_center);
if (global.isYourTurn == true)
{
	draw_text(guiWidth/2,240,"[YOUR TURN]");
} else draw_text(guiWidth/2,240,"[OPPONENTS TURN]");