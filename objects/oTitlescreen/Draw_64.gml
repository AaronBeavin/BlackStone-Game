display_set_gui_size(1360, 768);
draw_clear(c_black);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (state == 0) {

    // ===== TITLE SCREEN =====
    draw_text_transformed(1360 / 2, 768 * 0.4, "BLACKSTONE", 2.5, 2.5, 0);

    var _pulse = sin(get_timer() / 200000) * 0.3 + 0.7;
    draw_set_alpha(_pulse);
    draw_text_transformed(1360 / 2, 768 * 0.55, "CLICK TO START", 1.2, 1.2, 0);

    draw_set_alpha(0.5);
    draw_text_transformed(1360 / 2, 768 * 0.60, "Sound will be enabled", 0.9, 0.9, 0);
    draw_set_alpha(1.0);
}
else if (state == 1) {

    // ===== MULTI-STAGE INTRO TEXT =====

    var active_text;

    if (current_stage == 1) {
        active_text = intro_text;
    } else {
        active_text = second_text;
    }

    var _text_to_draw = string_copy(active_text, 1, floor(char_count));

    draw_text_ext_transformed(1360 / 2, 768 / 2, _text_to_draw, 34, 900, 1.1, 1.1, 0);

    // Show continue instructions when finished typing
    if (char_count >= string_length(active_text)) {

        var _pulse = sin(get_timer() / 200000) * 0.3 + 0.7;

        draw_set_alpha(_pulse);
        draw_text_transformed(
            1360 / 2,
            768 * 0.85,
            "[ SPACE = CONTINUE   |   ESC = SKIP ]",
            0.9,
            0.9,
            0
        );
        draw_set_alpha(1.0);
    }
}

// ===== FADE OVERLAY =====
if (fade_alpha > 0) {
    draw_set_color(c_black);
    draw_set_alpha(fade_alpha);
    draw_rectangle(0, 0, 1360, 768, false);
    draw_set_alpha(1.0);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);