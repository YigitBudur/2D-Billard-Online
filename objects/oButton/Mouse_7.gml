/// @description Insert description here
// You can write your code in this editor
image_index = 1;

if (buttonType == "room")
{	
	
	var buffer = buffer_create(1024, buffer_fixed, 1);
	buffer_seek(buffer,buffer_seek_start, 0);
	buffer_write(buffer, buffer_u8,4);
	buffer_write(buffer,buffer_u8, buttonName);
	network_send_packet(oSocket.socket, buffer, buffer_get_size(buffer));

	buffer_delete(buffer);
}







