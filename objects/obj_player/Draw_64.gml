// ==========================================
// 1. DRAW PLAYER HEALTH (HEART ICONS)
// ==========================================
var _heart_x = 30;
var _heart_y = 30;
var _heart_size = 16;

for (var i = 0; i < max_hp; i++) {
    // If the loop index is less than current health, draw a full red heart box
    if (i < player_hp) {
        draw_set_color(c_red);
    } else {
        // Otherwise, draw an empty dark gray silhouette background box
        draw_set_color(c_dkgray);
    }
    
    // Construct a standard geometric box container shape for each life point
    draw_rectangle(_heart_x + (i * 24), _heart_y, _heart_x + (i * 24) + _heart_size, _heart_y + _heart_size, false);
}

// ==========================================
// 2. DRAW SOUL METER (VESSEL CONTAINER VIAL)
// ==========================================
var _vessel_x = 40;
var _vessel_y = 80;
var _radius = 20;

// Draw the dark outer structural container framing backing circle
draw_set_color(c_black);
draw_circle(_vessel_x, _vessel_y, _radius + 3, false);
draw_set_color(c_dkgray);
draw_circle(_vessel_x, _vessel_y, _radius, false);

// Dynamically fill the container based on current accumulated soul charges
if (player_soul > 0) {
    draw_set_color(c_white);
    
    // Scale the inside glowing fill liquid radius based on capacity levels
    var _fill_radius = (_radius / 3) * player_soul;
    draw_circle(_vessel_x, _vessel_y, _fill_radius, false);
}

// ==========================================
// 3. DRAW CENTERED TOP SCREEN BOSS BAR
// ==========================================
if (instance_exists(obj_boss)) {
    // Math to center a 400-pixel wide bar perfectly on a 1360-pixel wide widescreen setup
    var _bar_w = 400;
    var _bar_h = 16;
    var _bar_x = (1360 / 2) - (_bar_w / 2); // Result: 480
    var _bar_y = 40;
    
    // Calculate precise current health scaling metrics
    var _hp_percent = obj_boss.boss_hp / obj_boss.boss_max_hp;
    var _current_fill_w = _bar_w * _hp_percent;
    
    // Draw the black backing border frame
    draw_set_color(c_black);
    draw_rectangle(_bar_x - 4, _bar_y - 4, _bar_x + _bar_w + 4, _bar_y + _bar_h + 4, false);
    
    // Draw the base empty background track layer
    draw_set_color(c_dkgray);
    draw_rectangle(_bar_x, _bar_y, _bar_x + _bar_w, _bar_y + _bar_h, false);
    
    // Overlay the active bright red remaining health pool rectangle channel
    if (obj_boss.boss_hp > 0) {
        draw_set_color(c_red);
        draw_rectangle(_bar_x, _bar_y, _bar_x + _current_fill_w, _bar_y + _bar_h, false);
    }
    
    // Label tag centered right underneath the active frame profile
    draw_set_color(c_white);
    draw_text((1360 / 2) - 40, _bar_y + _bar_h + 8, "THE CHOSEN BOSS");
}

// ==========================================
// 4. DRAW SYSTEM CONTROLS REMINDER (SAFE ANCHOR)
// ==========================================
// Placed in the bottom left corner so it never hits the boss text or status widgets
var _text_x = 30;
var _text_y = 720;

// Draw a subtle translucent backing rectangle for clean text separation
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(_text_x - 8, _text_y - 6, _text_x + 690, _text_y + 24, false);
draw_set_alpha(1.0); // Safely restore full alpha opacity pipeline

// Render text cleanly over the banner panel background
draw_set_color(c_white);
draw_text(_text_x, _text_y, "[Z] Attack  |  [X] Fireball (Costs 1 Soul)  |  Hold [C] to Focus Heal (Costs 1 Soul)");
