//Configurando o coyote timer
if (isGrounded){
	ctimer = climit;
}else{
	if (ctimer > 0) ctimer --;
}


//Controles
var _right, _left, _jump, _move, _jump_s, _dash;
_right = keyboard_check(ord("D"));
_left = keyboard_check(ord("A"));
_jump = keyboard_check_pressed(vk_space);
_jump_s = keyboard_check_released(vk_space);
_dash = mouse_check_button_pressed(mb_left);

//Checando se está no chão

isGrounded = place_meeting(x, y+1, obj_plat);
rwall = place_meeting(x+1, y, obj_plat);
lwall = place_meeting(x-1, y, obj_plat);

//Movimentação
_move = (_right - _left) * max_velv;
if (isGrounded){ 
	accel = accel_floor}else accel = accel_air;
// State Machine

switch(plStatus){
	case status.stopped:
		velh = 0;
		velv = 0;
		
		if (_jump && isGrounded){
			velv -= max_velv;
		}
//Gravidade

		if (!isGrounded){
		velv += grav
	}
		if (abs(velh) > 0 || abs(velv) > 0 || _left || _right || _jump){
				plStatus = status.moving;
			}
		
	break;
	
		case status.moving:
		//Particula de trilha
		if (isGrounded){
		trTimeW --;
		if trTimeW <= 0 && _left{
			var _inst = instance_create_layer(x + sprite_width / 2 , y + sprite_height /2, "particles",obj_trail);
			_inst.direction = random_range(0,20);
			trTimeW = 10;
		}
		if trTimeW <= 0 && _right{
			var _inst = instance_create_layer(x - sprite_width / 2 , y + sprite_height /2, "particles",obj_trail);
			_inst.direction = random_range(160,180);
			trTimeW = 10;
		}
		}
	
		//Movimentação
		velh = lerp(velh, _move, accel);
	
		//Gravidade
	
		if (!isGrounded && ((rwall && _right)|| (lwall && _left)) ){
			if (velv < 0){
				velv = 1;
					
				}
			}else velv += grav;
			//Pulo na parede
			
			if (rwall && _jump){
			velv = -max_velv;
			velh = -max_velh;
			xscale = .5;
			yscale = 1.5;
			}else if(lwall && _jump){
			velv = -max_velv;
			velh = max_velh;
			xscale = .5;
			yscale = 1.5;
			}else{
			
		
		//Jump buffer
		if(_jump) fall_timer = limit_buffer;
		
		if (fall_timer	> 0 ) buffer_jump = true;
		else buffer_jump = false;
		
		if (buffer_jump){
			if (isGrounded || ctimer){
				velv -= max_velv;
				//Alterando a escala durante o pulo
				xscale = .5;
				yscale = 1.6;
				
				ctimer = 0;
				fall_timer = 0;
			}
			fall_timer --;
		}
				
		//Controlando a altura do pulo
		
		if (_jump_s && velv < 0) velv *= .7;
			}
		
		//Dando o dash
		
		if (_dash && dashStack ){
			plStatus = status.dashing;
			dir = point_direction(x,y, mouse_x,mouse_y);
			dashStack = 0;
		//Alterando a sprite durante o dash
		//Se eu dashei para o lado ou pra vertical
		if (dir >= 0 && dir <= 60) || (dir >= 120 && dir <= 240) || (dir >= 300 && dir <= 359.9) {
			dashX = true;
			dashY = false;
		
		}	else {
			dashY = true;
			dashX = false;
		}
		
		}
		
		//Garantindo um pulo por vez
		if (isGrounded && plStatus != status.dashing) {
			dashStack = 1;
		}
		//Limitando a velocidade
		velv = clamp(velv, -max_velv, velv);
		
		//Voltando o controle do dash ao normal
		
		break;
	
			case status.dashing:
			 
			 
			 velh = lengthdir_x(len,dir);
			 velv = lengthdir_y(len,dir);
			 
			 dashDuration --;
			image_blend = c_red;
			//Criando o rastro
			var _inst = instance_create_layer(x,y,"particles",obj_player_trail);
			_inst.xscale = xscale;
			_inst.yscale = yscale;
			if dashX{
				xscale = 1.5;
				yscale = .5;
			}if dashY{
				xscale =.5;
				yscale = 1.5;
			}
			
			
			if (dashDuration <= 0){
				plStatus = status.moving;
				dashDuration = 12;
				image_blend = c_white;
				
				velh = (max_velh * sign(velh) * .5);
				velv = (max_velv * sign(velv) * .5);
			}
			
			 
			break;
}
// Voltando a escala original após o pulo
xscale = lerp(xscale,1,.15)
yscale = lerp(yscale,1,.15)