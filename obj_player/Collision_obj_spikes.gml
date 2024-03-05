for(ii = 0; ii <= 4; ii++){
	for(i = 0; i <= 20; i++){
		var _particle_angle = 16*i;
		var _inst = instance_create_depth(x,y,depth - 1000, obj_trail);
		_inst.direction = _particle_angle;
	}
}

layer_sequence_create("sequences", camera_get_view_x(view_camera[0]) + 683,camera_get_view_y(view_camera[0]) + 384 ,seq_gameover);
global.death = true;
instance_destroy();
