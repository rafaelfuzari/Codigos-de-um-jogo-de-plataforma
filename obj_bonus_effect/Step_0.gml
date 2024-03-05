image_xscale = xscale;
image_yscale = yscale;

xscale += .3;
yscale += .3;

if xscale >= 4{
 instance_destroy();
}