/// @description Starting Characteristics
// You can write your code in this editor


//Configurable stats
stats_name = "Bolt Knight";
stats_move_points_sqr  = 7;
stats_max_hp = 50;
stats_might = 50;
stats_hit_rate = 100;
stats_evade = 80;
stats_defence = 3;
stats_type = combat_type.swift;

//Attacks

//Derived stats
stats_current_hp = stats_max_hp-10;
move_points_pixels = stats_move_points_sqr * global.grid_cell_width;
move_points_pixels_curr = move_points_pixels;

cur_node_x = x;
cur_node_y = y;

//Sprites and animation
spr_portrait = spr_bolt_knight_portrait;
anim_idle = spr_bolt_knight_idle_placeholder;
anim_run = spr_bolt_knight_move_right;
anim_melee = spr_bolt_knight_attack_jab_placeholder;
anim_death = spr_speardude_death;