// Check collision with the boss
if (place_meeting(x, y, obj_boss)) {
    obj_boss.boss_hp -= 3; // Spells deal high damage
    instance_destroy();
}

// Check collision with walls to break projectile
if (place_meeting(x, y, obj_wall)) {
    instance_destroy();
}
