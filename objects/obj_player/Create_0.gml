//====================================================
// PLAYER CREATE EVENT
//====================================================

//------------------------
// Physics
//------------------------
hsp = 0;
vsp = 0;

grv = 0.5;
walk_spd = 5;
jump_spd = -12;
terminal_fall = 14;

//------------------------
// Facing
//------------------------
facing = 1;

//------------------------
// Health
//------------------------
max_hp = 5;
player_hp = max_hp;

//------------------------
// Soul
//------------------------
player_soul = 0;
max_soul = 3;

//------------------------
// Combat
//------------------------
attack_cooldown = 0;
attack_duration = 0;

combo = 0;
combo_timer = 0;

//------------------------
// Invincibility
//------------------------
invincible_timer = 0;

//------------------------
// Knockback
//------------------------
knockback_timer = 0;

//------------------------
// Healing
//------------------------
is_focusing = false;
focus_timer = 0;
focus_time_required = 60;

//------------------------
// Dash
//------------------------
dash_speed = 12;
dash_time = 8;

dash_timer = 0;
dash_cooldown = 0;
dash_cooldown_max = 30;

//------------------------
// Jump Assist
//------------------------
coyote_time = 6;
coyote_timer = 0;

jump_buffer = 6;
jump_buffer_timer = 0;

//------------------------
// Double Jump
//------------------------
max_jumps = 2;
jump_count = 0;

//------------------------
// Wall Movement
//------------------------
wall_slide_speed = 2;

//------------------------
// Pogo
//------------------------
pogo_bounce = -9;

//------------------------
// Camera Shake
//------------------------
camera_shake = 0;

//------------------------
// Animation
//------------------------
state = "idle";

//------------------------
// Misc
//------------------------
image_speed = 1;