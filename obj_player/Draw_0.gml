if (velh != 0) facing = sign(velh);

draw_sprite_ext(sprite_index,image_index,x,y,xscale * facing, yscale, image_angle, image_blend, image_alpha);
