// Monitor if the boss object is still alive
if (!instance_exists(obj_boss)) {
    if (!victory) {
        victory = true;

        audio_stop_sound(snd_boss_battle);
        audio_play_sound(snd_congratulations, 1, false);

        // Wait 2 seconds before showing the prompt
        victory_timer = room_speed * 2;
    }
}

// Countdown
if (victory && !show_prompt) {
    victory_timer--;

    if (victory_timer <= 0) {
        show_prompt = true;
    }
}

// Continue when W is pressed
if (show_prompt && keyboard_check_pressed(ord("W"))) {
    room_goto(rEndingText);
}