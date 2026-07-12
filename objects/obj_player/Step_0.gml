// 1. INPUT PARSING DECK
// 1. INPUT PARSING DECK
var _left  = keyboard_check(ord("A"));  // Changed from keyboard_check_pressed
var _right = keyboard_check(ord("D"));  // Changed from keyboard_check_pressed
var _jump  = keyboard_check_pressed(ord("W"));
var _melee = keyboard_check_pressed(ord("Z"));
var _range = keyboard_check_pressed(ord("X"));
var _heal  = keyboard_check(ord("C")); 

// 2. RUN DOWN COUNTDOWN ENGINE TIMERS
if (attack_cooldown > 0) attack_cooldown--;
if (invincible_timer > 0) invincible_timer--;

var _on_floor = place_meeting(x, y + 1, obj_wall);

// 3. SOUL FOCUS CHANNEL HEALING PIPELINE
if (_heal && _on_floor && player_soul >= 1 && player_hp < max_hp && hsp == 0) {
    is_focusing = true;
    focus_timer++;
    hsp = 0; 
    
    if (focus_timer >= focus_time_required) {
        player_hp += 1;
        player_soul -= 1;
        focus_timer = 0; 
    }
} else {
    is_focusing = false;
    focus_timer = 0;
}

// 4. MOTION CALCULATIONS BLOCK
if (!is_focusing) {
    hsp = (_right - _left) * walk_spd;
} else {
    hsp = 0; 
}
vsp += grv;

if (_on_floor && _jump && !is_focusing) {
    vsp = jump_spd;
}

// 5. INTENSITY COLLISION CALCULATIONS FLOORING LOOP 
if (place_meeting(x + hsp, y, obj_wall)) {
    while (!place_meeting(x + sign(hsp), y, obj_wall)) x += sign(hsp);
    hsp = 0;
}
x += hsp;

if (place_meeting(x, y + vsp, obj_wall)) {
    while (!place_meeting(x, y + sign(vsp), obj_wall)) y += sign(vsp);
    vsp = 0;
}
y += vsp;

// 6. DETECT ENEMY IMPACT COLLIDERS (TAKE DAMAGE)
if (place_meeting(x, y, obj_boss) && invincible_timer <= 0) {
    player_hp -= 1;
    invincible_timer = 45; 
    is_focusing = false; 
    focus_timer = 0;
    
    vsp = -6;
    hsp = (x > obj_boss.x) ? 8 : -8; // Snappy retro directional knockback push
}

if (player_hp <= 0) {
    room_restart();
}

// 7. TRACK ORIENTATION SCALES WITHOUT SQUISHING VALUES
if (hsp > 0) image_xscale = 1.5;
if (hsp < 0) image_xscale = -1.5;

// 8. COMBAT ACTIVE ARMED FIRE TRIGGERS
if (!is_focusing) {
    // Melee Attack Input (Z)
    if (_melee && attack_cooldown == 0) {
        attack_cooldown = 20;
        if (asset_get_index("snd_slash") != -1) {
            audio_play_sound(asset_get_index("snd_slash"), 5, false);
        }
        
        if (instance_exists(obj_boss)) {
            var _range_check = 60; // Max reach distance length of melee strike
            
            if (image_xscale > 0 && bbox_right + _range_check >= obj_boss.bbox_left && bbox_left <= obj_boss.bbox_right && bbox_bottom >= obj_boss.bbox_top && bbox_top <= obj_boss.bbox_bottom) {
                obj_boss.boss_hp -= 1;
                player_soul = min(player_soul + 1, 3);
            }
            if (image_xscale < 0 && bbox_left - _range_check <= obj_boss.bbox_right && bbox_right >= obj_boss.bbox_left && bbox_bottom >= obj_boss.bbox_top && bbox_top <= obj_boss.bbox_bottom) {
                obj_boss.boss_hp -= 1;
                player_soul = min(player_soul + 1, 3);
            }
        }
    }

    // Ranged Spell Fire Input (X)
    if (_range && attack_cooldown == 0 && player_soul >= 1) {
        player_soul -= 1;
        attack_cooldown = 25;
        if (asset_get_index("snd_fireball") != -1) {
            audio_play_sound(asset_get_index("snd_fireball"), 5, false);
        }
        
        // Lowered spawn origin point from y-24 to y-48 to shoot right from the chest center
        var _b = instance_create_layer(x, y - 48, "Instances", obj_fireball);
        _b.direction = (image_xscale > 0) ? 0 : 180;
    }
}
