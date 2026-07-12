// Control flags
victory = false;
show_prompt = false;
victory_timer = 0;

// Audio
audio_stop_all();
if (audio_exists(snd_boss_battle)) {
    audio_play_sound(snd_boss_battle, 10, true);
}