// 1. Get Inputs
var _key_left  = keyboard_check(vk_left)  || keyboard_check(ord("A"));
var _key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _key_jump  = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W"));


// 2. Reset ground state
on_ground = false;


// 3. Horizontal movement
var _move = _key_right - _key_left;
hsp = _move * walk_speed;


// 4. Gravity
vsp += grv;


// 5. Check if standing on ground/platform
if (place_meeting(x, y + 1, oSolid) || place_meeting(x, y + 1, oMovingSolid))
{
    on_ground = true;
}


// 6. Jump
if (on_ground && _key_jump)
{
    vsp = jump_speed;
}


// 7. Horizontal collision
if (place_meeting(x + hsp, y, oSolid) || place_meeting(x + hsp, y, oMovingSolid))
{
    while (!place_meeting(x + sign(hsp), y, oSolid) &&
           !place_meeting(x + sign(hsp), y, oMovingSolid))
    {
        x += sign(hsp);
    }

    hsp = 0;
}

x += hsp;


// 8. Vertical collision
if (place_meeting(x, y + vsp, oSolid) || place_meeting(x, y + vsp, oMovingSolid))
{
    while (!place_meeting(x, y + sign(vsp), oSolid) &&
           !place_meeting(x, y + sign(vsp), oMovingSolid))
    {
        y += sign(vsp);
    }

    vsp = 0;
}

y += vsp;


// 9. Carry player with moving platform
var plat = instance_place(x, y + 1, oMovingSolid);

if (plat != noone)
{
    x += plat.move_x;
    y += plat.move_y;
}


// 10. Sprite direction
if (hsp != 0)
{
    facing = sign(hsp);
}

image_xscale = facing;