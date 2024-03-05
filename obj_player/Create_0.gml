// Dados de gravidade

grav = .3;
accel_floor = .1;
accel_air = .07;
accel = accel_floor;

// Velocidades

velh = 0;
velv = 0;
drift = 1;

// Limite das velocidades
max_velh = 6;
max_velv = 8;
len = 15;

// Variáveis de controle
isGrounded = false;
dashDuration =	12;
rwall = false;
lwall = false;
trTime = 5;
trTimeW = 10;
facing = 1;
dashX = false;
dashY = false;
deathParticle = 5;

// Coyote Timer
climit = 4;
ctimer = climit;

//Jump Buffer
limit_buffer = 6;
fall_timer = 0 ;
buffer_jump = false;

//Escala
xscale = 1;
yscale = 1;

//Controle
dir = 0;
dashStack = 1;

enum status{
	stopped, moving, dashing,
}
plStatus = status.stopped;


if (!instance_exists(obj_camera)){
	instance_create_layer(0,0,"platforms",obj_camera);
}