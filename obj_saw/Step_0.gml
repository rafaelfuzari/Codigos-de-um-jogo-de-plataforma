image_angle += rot;

switch(state){
	case "charging":
	
	//Descobrindo a direção do limite
	var _limit_x = lengthdir_x(limit, dir);
	var _limit_y = lengthdir_y(limit, dir);
	
	//Movendo
	x += lengthdir_x(vel, dir);
	y += lengthdir_y(vel, dir);
	
	//Trocando de estado
	if (_limit_x > 0){
		if (x >= xstart + _limit_x) state = "backing";
	}else if(_limit_x < 0){
		if (x <= xstart + _limit_x) state = "backing";
	}
	if (_limit_y > 0){
		if (y >= ystart + _limit_y) state = "backing";
	}else if (_limit_y < 0){
		if (y <= ystart + _limit_y) state = "backing";
	}

	
	break;
	
	case "backing":
	 x -= lengthdir_x(vel, dir);
	 y -= lengthdir_y(vel, dir);
	
	 if (x == xstart && y == ystart ) state = "charging";

	
	
	break;
	
	case "idle":
	
	break;
}
	