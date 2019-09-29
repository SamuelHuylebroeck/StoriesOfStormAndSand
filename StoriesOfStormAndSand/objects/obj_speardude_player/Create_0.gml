/// @description Starting Characteristics
// You can write your code in this editor


//Configurable stats
move_points_sqr  = 4;

//Derived stats
move_points_pixels = move_points_sqr * global.grid_cell_width;
move_points_pixels_curr = move_points_pixels;

cur_node_x = x;
cur_node_y = y;

anim_idle = spr_speardude_idle_rdy;
anim_run = spr_speardude_walking_left;
anim_melee = spr_speardude_stabbing;