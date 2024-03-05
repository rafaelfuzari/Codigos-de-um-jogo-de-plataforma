var _floor = place_meeting(x,y +1, obj_plat);

if (_floor && !isGrounded){
xscale = 1.6;
yscale = .5;
for (i = 0; i <= 7; i++){
	var _xx = x,
	var _yy = y + sprite_height /2 ;
	instance_create_layer(_xx, _yy, "particles", obj_trail);
}
}
//Particula de trila na parede
if rwall {
	trTime --;
	if trTime <= 0{
	instance_create_layer(x + sprite_width / 2, y - sprite_height / 2, "particles", obj_trail);
		trTime = 5;
	}
		}
if lwall {
	trTime --;
	if trTime <= 0{
	instance_create_layer(x - sprite_width / 2, y - sprite_height / 2, "particles", obj_trail);
		trTime = 5;
		
	}}