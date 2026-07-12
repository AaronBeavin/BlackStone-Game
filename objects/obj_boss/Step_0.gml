// 1. GRAVITY ENGINE
var _grv = 0.5;
var _on_ground = place_meeting(x, y + 1, obj_wall);

if (!_on_ground) {
    vsp_boss += _grv; // Fall naturally
} else {
    vsp_boss = 0; // Reset vertical momentum on ground
}

// 2. STATE MACHINE ENGINE
timer--;

switch (state) {
    case 0: // Idle State
        if (instance_exists(obj_player)) {
            image_xscale = (obj_player.x > x) ? 1 : -1;
        }
        if (timer <= 0) {
            state = 1; 
            timer = 40; 
        }
        break;
        
    case 1: // Telegraph Phase (Warning Flash)
        if (instance_exists(obj_player)) {
            image_xscale = (obj_player.x > x) ? 1 : -1;
        }
        if (timer <= 0) {
            state = 2; 
            timer = 60; // Dash window duration
        }
        break;
        
    case 2: // Active Dash & Forced Jump Over Obstacles Phase
        boss_current_speed = 10 * image_xscale;
        
        // Check if there is an obstacle directly blocking our horizontal path
        if (place_meeting(x + boss_current_speed, y, obj_wall)) {
            
            // --- STEP 1: TRY STEPPING UP EXTENDED PLATFORMS AUTOMATICALLY ---
            var _stepped_up = false;
            // Scan up to 64 pixels high to see if we can just step over it smoothly
            for (var i = 1; i <= 64; i++) {
                if (!place_meeting(x + boss_current_speed, y - i, obj_wall)) {
                    y -= i; // Snap directly up to the platform lip
                    _stepped_up = true;
                    break;
                }
            }
            
            // --- STEP 2: IF THE PLATFORM IS TOO HIGH, TRIGGER A FORCED JUMP ---
            if (!_stepped_up && _on_ground) {
                vsp_boss = -15; // Launch high into the air!
            }
        }
        
        // FORCE HORIZONTAL TRAVEL IN AIR 
        // We bypass standard wall stopping if we are mid-jump so the boss keeps sailing forward
        if (!place_meeting(x + boss_current_speed, y, obj_wall) || !_on_ground) {
            x += boss_current_speed;
        } else if (_on_ground) {
            // Hit a complete solid room boundary wall at floor level, stop dashing
            state = 0;
            timer = 45;
        }
        
        // Reset when timer finishes and boss lands safely
        if (timer <= 0 && _on_ground) {
            state = 0; 
            timer = 60; 
        }
        break;
}

// 3. PIXEL-PERFECT VERTICAL COLLISION CALCULATION
if (place_meeting(x, y + vsp_boss, obj_wall)) {
    while (!place_meeting(x, y + sign(vsp_boss), obj_wall)) {
        y += sign(vsp_boss);
    }
    vsp_boss = 0;
}
y += vsp_boss;

// 4. CLEAN DESTRUCTION PIPELINE
if (boss_hp <= 0) {
    instance_destroy();
}
