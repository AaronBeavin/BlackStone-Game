display_set_gui_size(1360, 768);
draw_clear(c_black);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var active_text = (state == 0) ? line_1 : line_2;
var _text_to_draw = string_copy(active_text, 1, floor(char_count));

// Draw text centered on screen
draw_text_ext_transformed(1360 / 2, 768 / 2, _text_to_draw, 34, 900, 1.1, 1.1, 0);

// Draw clean bottom fade overlay
if (fade_alpha > 0) {
    draw_set_color(c_black);
    draw_set_alpha(fade_alpha);
    draw_rectangle(0, 0, 1360, 768, false);
    draw_set_alpha(1.0);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);