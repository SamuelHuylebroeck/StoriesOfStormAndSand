/// @description Starting Characteristics
// You can write your code in this editor


//Configurable stats
stats_move_points_sqr  = 4;
stats_max_hp = 50;
stats_might = 50;
stats_hit_rate = 100;
stats_evade = 80;
stats_defence = 3;

//Derived stats
stats_current_hp = stats_max_hp;
move_points_pixels = stats_move_points_sqr * global.grid_cell_width;
move_points_pixels_curr = move_points_pixels;

cur_node_x = x;
cur_node_y = y;

anim_idle = spr_speardude_idle_rdy;
anim_run = spr_speardude_walking_left;
anim_melee = spr_speardude_stabbing;
anim_death = spr_speardude_death;