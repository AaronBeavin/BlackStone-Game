// 1. Draw Player base graphics with i-frame flashing
if (invincible_timer > 0 && (invincible_timer div 4) % 2 == 0) {
    // Leave blank for flickering visual trick
} else {
    draw_self();
}

// 2. Draw Focus Channel charging visual ring loops
if (is_focusing) {
    draw_set_color(c_white);
    draw_circle(x, y - 32, 24 + sin(current_time * 0.05) * 4, true);
}
// 3. Draw the Actual Sword Sprite (Inverted and Pushed Outward)
if (attack_cooldown > 10) {
    var _frame = (20 - attack_cooldown) div 3;
    
    // Increase or decrease this number to change how far away the blade spawns!
    var _offset = 32; 
    
    if (image_xscale > 0) {
        // Facing Right: Added _offset to push it further out to the right
        draw_sprite_ext(spr_sword_slash, _frame, bbox_right + _offset, y - 48, -1, 1, 0, c_white, 1);
    } else {
        // Facing Left: Subtracted _offset to push it further out to the left
        draw_sprite_ext(spr_sword_slash, _frame, bbox_left - _offset, y - 48, 1, 1, 0, c_white, 1);
    }
}

