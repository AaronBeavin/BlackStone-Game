// Stop all previous music so tracks do not overlap
audio_stop_all();

// Play the correct song based on the current room
switch (room)
{
    // Both of these rooms will play the exact same song
    case rVillage:
    case rCave:
	case Room1:
        audio_play_sound(snd_normal, 10, true);
        break;
        
    // The third room plays its own unique song
    case Room1_1:
        audio_play_sound(snd_boss_battle, 10, true);
        break;
}
