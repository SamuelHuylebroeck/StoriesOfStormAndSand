/// @description Starting Characteristics
// You can write your code in this editor

//Configurable stats
stats_name = "Noble Stormcaller";
stats_move_points_sqr  = 3;
stats_max_hp = 60;
stats_type = combat_type.brutal;
stats_armor_normal = 5;
stats_armor_weak = 2;
stats_evade_normal = 15;
stats_evade_weak = 0;
stats_spike_normal  = 10;
stats_spike_weak = 5;

//Attack stats
ds_attack_list = ds_list_create();
//Attack one
attack_one[attack_fields.name] = "Windhammer"
attack_one[attack_fields.range_min] = 3 ;
attack_one[attack_fields.range_max] = 5;
attack_one[attack_fields.type] = combat_type.brutal;
attack_one[attack_fields.strength_weak] = 20 ;
attack_one[attack_fields.strength_normal] = 50;
attack_one[attack_fields.hit_normal] = 90;
attack_one[attack_fields.hit_weak] = 40;
attack_one[attack_fields.animation] = spr_wave_knight_attack_glacier_slash_placeholder;
attack_one[attack_fields.animation_hit_frame] = 9;
ds_list_add(ds_attack_list,attack_one);
//Attack two
attack_two[attack_fields.name] = "Lightning Curtain"
attack_two[attack_fields.range_min] = 1;
attack_two[attack_fields.range_max] = 1;
attack_two[attack_fields.type] = combat_type.stalwart;
attack_two[attack_fields.strength_weak] = 10;
attack_two[attack_fields.strength_normal] = 30;
attack_two[attack_fields.hit_normal] = 100;
attack_two[attack_fields.hit_weak] = 70;
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
spr_portrait = spr_portrait_black_placeholder;
animations[unit_animation_fields.defender] = spr_bolt_knight_defender_placehoder;
animations[unit_animation_fields.death_attacker] = spr_bolt_knight_death_attacker;
animations[unit_animation_fields.death_defender] = spr_bolt_knight_death_defender;
animations[unit_animation_fields.idle] = spr_map_idle_shield_black_placeholder;
animations[unit_animation_fields.move_ltr] = spr_walk_ltr_placeholder;
animations[unit_animation_fields.move_rtl] = spr_walk_rtl_placeholder;
animations[unit_animation_fields.move_ttb] = spr_bolt_knight_walk_top_to_bottom;
animations[unit_animation_fields.move_btt] = spr_walk_btt_placeholder;

