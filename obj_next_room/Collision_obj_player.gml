
if global.canPass{
if (room_next(room) != -1){
	transition();
}else{
		game_restart();
		}	
	global.canPass = false;
}

	