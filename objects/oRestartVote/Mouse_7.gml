/// @description Insert description here


image_index = 0;
restartVoteSent = true;

if (restartVoteSent == true and sent == 0) // Player voted to Restart
{
	var buffer = buffer_create(1024, buffer_fixed, 1);
	buffer_seek(buffer, buffer_seek_start, 0);
	buffer_write(buffer, buffer_u8,3);
	network_send_packet(oSocket.socket, buffer, buffer_get_size(buffer));
	buffer_delete(buffer);
	sent += 1;
}









