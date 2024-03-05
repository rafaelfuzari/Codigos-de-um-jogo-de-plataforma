if room_change == false{
	alpha += .02;
}else alpha -= .02;

if alpha >= 1 && room_change == false{
	room_goto(destiny);
}
