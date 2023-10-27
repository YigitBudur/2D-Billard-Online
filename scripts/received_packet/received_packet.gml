// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function received_packet(buffer){
	
	msgid = buffer_read(buffer, buffer_u8);	
	
	switch(msgid){
		case 1:
			//isTurn = buffer_read(buffer, buffer_u8);
			//if(isTurn == 1){
			//	global.isYourTurn = true;
			//}
			
			var xx = buffer_read(buffer, buffer_f32);
			var yy = buffer_read(buffer, buffer_f32);
			show_debug_message(xx);
			show_debug_message(yy);
			with(oBall)
			{
			if (ballType == 0)
				{
					physics_apply_force(x,y, xx, yy);
					
				}
			} 
			
			//for (var i = 0; i < ds_list_size(socket_list); i++) {
			//    var hedefKimlik = ds_list_find_value(socket_list, i);
			//    if (hedefKimlik != socket) {
			//		send_buffer = buffer_create(1024,buffer_fixed, 1);
			//		buffer_seek(send_buffer, buffer_seek_start, 0);
			//		buffer_write(send_buffer, buffer_u8,1);
			//		buffer_write(send_buffer, buffer_f32,len_x);
			//		buffer_write(send_buffer, buffer_f32,len_y);
			//        network_send_packet(hedefKimlik, send_buffer, buffer_get_size(send_buffer));
			//    }
			//}
	}
	
}