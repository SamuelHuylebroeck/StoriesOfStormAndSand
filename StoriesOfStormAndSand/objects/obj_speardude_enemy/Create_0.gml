/// @description Variables
// You can write your code in this editor

//Configurable stats
stats_name = "Spear Dude";
stats_move_points_sqr  = 7;
stats_max_hp = 50;
stats_type = combat_type.stalwart;
stats_armor_normal = 10;
stats_armor_weak = 3;
stats_evade_normal = 25;
stats_evade_weak = 10;
stats_spike_normal  = 5;
stats_spike_weak = 2;

//Attack stats
ds_attack_list = ds_list_create();
//Attack one
attack_one[attack_fields.name] = "Lightning Jab"
attack_one[attack_fields.range_min] = 1 ;
attack_one[attack_fields.range_max] = 1;
attack_one[attack_fields.type] = combat_type.swift;
attack_one[attack_fields.strength_weak] = 5;
attack_one[attack_fields.strength_normal] = 15;
attack_one[attack_fields.hit_normal] = 120;
attack_one[attack_fields.hit_weak] = 90;
attack_one[attack_fields.animation] = spr_bolt_knight_attack_jab_placeholder;
ds_list_add(ds_attack_list,attack_one);
//Attack two
attack_two[attack_fields.name] = "Lightning Blast"
attack_two[attack_fields.range_min] = 2;
attack_two[attack_fields.range_max] = 3;
attack_two[attack_fields.type] = combat_type.brutal;
attack_two[attack_fields.strength_weak] = 10;
attack_two[attack_fields.strength_normal] = 20;
attack_two[attack_fields.hit_normal] = 100;
attack_two[attack_fields.hit_weak] = 70;
attack_two[attack_fields.animation] = spr_bolt_knight_attack_blast_placeholder;
ds_list_add(ds_attack_list,attack_two);

//old stats
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

//Configurable stats
stats_move_points_sqr  = 4;
stats_max_hp = 50;
stats_might = 10;
stats_hit_rate = 100;
stats_evade = 80;
stats_defence = 3;

//Derived stats
stats_current_hp = stats_max_hp;
move_points_pixels = stats_move_points_sqr * global.grid_cell_width;
move_points_pixels_curr = move_points_pixels;

cur_node_x = x;
cur_node_y = y;

animations[unit_animation_fields.defender] = spr_bolt_knight_defender_placehoder;

anim_idle = spr_speardude_idle_rdy_enemy;
anim_run = spr_speardude_walking_left;
anim_melee = spr_speardude_stabbing;
anim_death = spr_speardude_death_enemy;