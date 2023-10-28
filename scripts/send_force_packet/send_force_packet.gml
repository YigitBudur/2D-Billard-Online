// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function send_force_packet(len_x, len_y){
	
	var buffer = buffer_create(1024, buffer_fixed,1)
	buffer_seek(buffer, buffer_seek_start,0);
	buffer_write(buffer, buffer_u8, 1);
	buffer_write(buffer, buffer_f32, len_x);
	buffer_write(buffer, buffer_f32, len_y);
	network_send_packet(oGame.socket,buffer, buffer_get_size(buffer));
	buffer_delete(buffer);
	
}