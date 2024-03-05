if global.death{
	if keyboard_check_pressed(vk_enter){
		room_restart();
		global.death = false;
	}
}
if (!instance_exists(obj_item)){
	global.canPass = true;
}

if (instance_exists(obj_player)){
	if (!instance_exists(obj_camera)){
	instance_create_layer(0,0,"instances",obj_camera);
	}
}

if !instance_exists(obj_cursor){
	instance_create_layer(x,y,"sequences",obj_cursor);
}