// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function received_packet(buffer){
	
	msgid = buffer_read(buffer, buffer_u8);	
	
	switch(msgid){
		case 1:
			
			var turn = buffer_read(buffer, buffer_u8);	
			
			var xx = buffer_read(buffer, buffer_f32);
			var yy = buffer_read(buffer, buffer_f32);
			with(oBall)
			{
			if (ballType == 0)
				{
					physics_apply_force(x,y, xx, yy);
					if(turn == 2){
						global.isYourTurn = true;
					}
				}
			} 
		case 2:
			show_debug_message("case 2");
			var turn = buffer_read(buffer, buffer_u8);
			if(turn == 1){
				global.isYourTurn = true;
			}
		case 4:
			//show_message("odaya giriliyor");
			var isRoomEmpty = buffer_read(buffer, buffer_bool);
			if(isRoomEmpty){
				//show_message("oda boştu giriyoruz");
				room_goto(rmGame);
			}else{
				//show_message("oda dolu yallah");
			}
			break;
			
			
		case 10:
			show_message("Opponent left. You win");
		
		default:
			show_debug_message("default");
			break;
	}
		
}
	