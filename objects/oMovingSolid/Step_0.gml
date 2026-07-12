// Save old position
var old_x = x;
var old_y = y;

// Move platform
x += move_speed * move_dir;

if (x >= start_x + distance)
{
    move_dir = -1;
}

if (x <= start_x)
{
    move_dir = 1;
}

// Store movement amount
move_x = x - old_x;
move_y = y - old_y;