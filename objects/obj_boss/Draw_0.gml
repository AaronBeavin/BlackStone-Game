// Visual orange tint flag helper logic during attack telegraph warnings
if (state == 1) {
    gpu_set_fog(true, c_orange, 0, 0);
    draw_self();
    gpu_set_fog(false, c_white, 0, 0);
} else {
    draw_self();
}
