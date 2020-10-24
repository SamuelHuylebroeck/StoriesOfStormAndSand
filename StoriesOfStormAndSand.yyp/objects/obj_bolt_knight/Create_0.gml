/// @description Starting Characteristics
// You can write your code in this editor

//Configurable stats
stats_name = "Bolt Knight";
stats_move_points_sqr  = 7;
stats_max_hp = 100;
stats_type = combat_type.swift;
stats_armor_normal = 12;
stats_armor_weak = 4;
stats_evade_normal = 50;
stats_evade_weak = 25;
stats_spike_normal  = 3;
stats_spike_weak = 2;

//Attack stats
ds_attack_list = ds_list_create();
//Attack one
attack_one[attack_fields.name] = "Lightning Jab"
attack_one[attack_fields.range_min] = 1 ;
attack_one[attack_fields.range_max] = 1;
attack_one[attack_fields.type] = combat_type.swift;
attack_one[attack_fields.strength_weak] = 28 ;
attack_one[attack_fields.strength_normal] = 40;
attack_one[attack_fields.hit_normal] = 120;
attack_one[attack_fields.hit_weak] = 96;
attack_one[attack_fields.animation] = spr_bolt_knight_attack_jab;
attack_one[attack_fields.animation_hit_frame] = 7;
ds_list_add(ds_attack_list,attack_one);
//Attack two
attack_two[attack_fields.name] = "Lightning Blast"
attack_two[attack_fields.range_min] = 2;
attack_two[attack_fields.range_max] = 3;
attack_two[attack_fields.type] = combat_type.brutal;
attack_two[attack_fields.strength_weak] = 55;
attack_two[attack_fields.strength_normal] = 39;
attack_two[attack_fields.hit_normal] = 75;
attack_two[attack_fields.hit_weak] = 60;
attack_two[attack_fields.animation] = spr_bolt_knight_attack_blast_placeholder;
attack_two[attack_fields.animation_hit_frame] = 14;
ds_list_add(ds_attack_list,attack_two);

//Derived stats
stats_current_hp = stats_max_hp;
move_points_pixels = stats_move_points_sqr * global.grid_cell_width;
move_points_pixels_curr = move_points_pixels;

has_acted_this_round = false;
is_moving = false;

occupied_terrain = noone;

//Sprites and animation
spr_portrait = spr_bolt_knight_portrait;
animations[unit_animation_fields.defender] = spr_bolt_knight_defender_placehoder;
animations[unit_animation_fields.death_attacker] = spr_bolt_knight_death_attacker;
animations[unit_animation_fields.death_defender] = spr_bolt_knight_death_defender;
animations[unit_animation_fields.idle] = spr_bolt_knight_idle;
animations[unit_animation_fields.move_ltr] = spr_walk_ltr_placeholder;
animations[unit_animation_fields.move_rtl] = spr_walk_rtl_placeholder;
animations[unit_animation_fields.move_ttb] = spr_bolt_knight_walk_top_to_bottom;
animations[unit_animation_fields.move_btt] = spr_walk_btt_placeholder;

