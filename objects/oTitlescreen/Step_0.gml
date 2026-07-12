// ===== TITLE SCREEN STATE =====
if (state == 0) {
    // Detect mouse click or Spacebar to transition to intro typing
    if (mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_space)) {
        state = 1;
        char_count = 0;
        current_stage = 1; // Double check we start on first paragraph
    }
} 

// ===== INTRO TYPEWRITER STATE =====
else if (state == 1) {
    // ESC skips intro entirely
    if (keyboard_check_pressed(vk_escape)) {
        room_goto(rVillage);
    }

    // Check which text block we are currently rendering
    var active_text = (current_stage == 1) ? intro_text : second_text;

    if (char_count < string_length(active_text)) {
        char_count += typewrite_speed;

        // Spacebar instantly autofills current typing line
        if (keyboard_check_pressed(vk_space)) {
            char_count = string_length(active_text);
        }
    } 
    else {
        // Line is fully typed -> Wait for Space or Click to proceed
        if (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)) {
            if (current_stage == 1) {
                current_stage = 2; // Move directly to second paragraph
                char_count = 0;    // Reset typewriting count
            }
            else {
                fade_out = true;   // Both paragraphs finished! Begin rVillage fade
            }
        }
    }
}

// ===== FADE OUT TRANSITION =====
if (fade_out) {
    fade_alpha += 0.03;
    if (fade_alpha >= 1) {
        fade_alpha = 1;
        room_goto(target_room);
    }
}