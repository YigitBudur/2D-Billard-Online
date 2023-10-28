/// @description Insert description here
// You can write your code in this editor
type_of_event = ds_map_find_value(async_load, "type");
show_debug_message("async birden çok kez çağrıldı");


switch(type_of_event){
	
	case network_type_data:
	
	    buffer = ds_map_find_value(async_load, "buffer");
	    buffer_seek(buffer, buffer_seek_start, 0);
		buffer_seek(buffer, buffer_seek_start, 0)
		received_packet(buffer);
		
	    
		break;
		
}