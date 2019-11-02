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

animations[unit_animation_fields.defender] = 

anim_idle = spr_spearman_player_left_pose;
anim_run = spr_spearman_player_walk_left;
anim_melee = spr_speardude_stabbing;
anim_death = spr_speardude_death;