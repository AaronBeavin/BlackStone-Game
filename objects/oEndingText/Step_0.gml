var active_text = (state == 0) ? line_1 : line_2;

if (char_count < string_length(active_text)) {
    char_count += typewrite_speed;
    
    // SPACE instantly finishes the current line
    if (keyboard_check_pressed(vk_space)) {
        char_count = string_length(active_text);
    }
} 
else {
    // Line finished -> Wait for Space press to advance
    if (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)) {
        if (state == 0) {
            state = 1;
            char_count = 0;
        } else {
            fade_out = true;
        }
    }
}

// Fade out and restart game on completion
if (fade_out) {
    fade_alpha += 0.02;
    if (fade_alpha >= 1) {
        game_restart(); // Restart the game cleanly back to titlescreen
    }
}