/// @description Insert description here
draw_set_halign(fa_left);
draw_set_font(fntDefault);
draw_text(20,40,"FPS: "+string(floor(fps))+" ["+string(floor(fps_real))+"]");

#region Draw Balls inside the pool table
draw_set_halign(fa_center);
var guiWidth = display_get_gui_width();
var guiHeight = display_get_gui_height();
draw_text(guiWidth/2,20,"RED BALLS INSIDE: " + string(global.redBallsINSIDE));
draw_text(guiWidth/2,40,"YELLOW BALLS INSIDE: " + string(global.yellowBallsINSIDE));
#endregion

#region DEBUG the gameState
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
	draw_set_font(fntBig);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(guiWidth/2,guiHeight/2,global.winner + " HAS WON");
	draw_set_valign(fa_top);
}
#endregion

#region Draw the TURN text
draw_set_font(fntDefault);
draw_set_halign(fa_center);
if (global.isYourTurn == true)
{
	draw_text(guiWidth/2,230,"[YOUR TURN]");
} else draw_text(guiWidth/2,230,"[OPPONENTS TURN]");
#endregion

// Draw the Restart Timer
if (alarm_get(0) > 0)
{
	draw_text(guiWidth/2,250,"GAME RESTARTS IN: "+string(alarm_get(0)));	
}

// Waiting For Opponent
if (connectedPlayers < 2)
{
	draw_set_font(fntBig);
	draw_text(guiWidth/2,guiHeight/2,"[WAITING FOR OPPONENT]"+string(alarm_get(0)));	
}