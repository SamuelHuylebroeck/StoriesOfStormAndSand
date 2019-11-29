/// @description Starting Characteristics
// You can write your code in this editor

//Configurable stats
stats_name = "Flame Brawler";
stats_move_points_sqr  = 6;
stats_max_hp = 60;
stats_type = combat_type.brutal;
stats_armor_normal = 10;
stats_armor_weak = 10;
stats_evade_normal = 25;
stats_evade_weak = 0;
stats_spike_normal  = 5;
stats_spike_weak = 2;

//Attack stats
ds_attack_list = ds_list_create();
//Attack one
attack_one[attack_fields.name] = "Blazing Rush"
attack_one[attack_fields.range_min] = 1 ;
attack_one[attack_fields.range_max] = 1;
attack_one[attack_fields.type] = combat_type.swift;
attack_one[attack_fields.strength_weak] = 5;
attack_one[attack_fields.strength_normal] = 15;
attack_one[attack_fields.hit_normal] = 80;
attack_one[attack_fields.hit_weak] = 30;
attack_one[attack_fields.animation] = spr_flame_brawler_attack_blazing_rush_placeholder;
attack_one[attack_fields.animation_hit_frame] = 12;
ds_list_add(ds_attack_list,attack_one);
//Attack two
attack_two[attack_fields.name] = "Heat Javelin"
attack_two[attack_fields.range_min] = 2;
attack_two[attack_fields.range_max] = 3;
attack_two[attack_fields.type] = combat_type.stalwart;
attack_two[attack_fields.strength_weak] = 10;
attack_two[attack_fields.strength_normal] = 20;
attack_two[attack_fields.hit_normal] = 100;
attack_two[attack_fields.hit_weak] = 70;
attack_two[attack_fields.animation] = spr_flame_brawler_attack_heat_javelin_placeholder;
attack_two[attack_fields.animation_hit_frame] = 14;
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

has_acted_this_round = false;
is_moving = false;

//Sprites and animation
spr_portrait = spr_bolt_knight_portrait;
animations[unit_animation_fields.defender] = spr_bolt_knight_defender_placehoder;
animations[unit_animation_fields.death_attacker] = spr_bolt_knight_death_attacker;
animations[unit_animation_fields.death_defender] = spr_bolt_knight_death_defender;
animations[unit_animation_fields.idle] = spr_map_idle_placeholder;
animations[unit_animation_fields.move_ltr] = spr_walk_ltr_placeholder;
animations[unit_animation_fields.move_rtl] = spr_walk_rtl_placeholder;
animations[unit_animation_fields.move_ttb] = spr_walk_ttb_placeholder;
animations[unit_animation_fields.move_btt] = spr_walk_btt_placeholder;
