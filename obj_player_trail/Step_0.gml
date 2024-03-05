image_xscale = xscale;
image_yscale = yscale;
image_alpha -= .05;
if (image_alpha <= 0) instance_destroy();