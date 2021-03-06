/// @description Assign globals

//global defaults
global.default_map = rm_game;

// Grid globals and default values
global.grid_left_startpos = 24;
global.grid_top_startpos = 24;
global.grid_nr_h_cells = 25;
global.grid_nr_v_cells = 25;
global.grid_cell_width = 48;
global.grid_cell_height = 48;

//Pathing globals
global.path_allow_diag  = 0;
global.path_move_speed = 3;

//Terrain global
global.busy_percentage = 20;

//Debug globals
global.debug_draw_grid = false;

//Combat stats globals
global.attack_max_range = 4;

//Querty Azerty stuff
global.azerty = true;
global.up = global.azerty?"Z":"W";
global.left = global.azerty?"Q":"A";
global.down = "S";
global.right = "D";

//camera control
global.camera_controllable = true;

//animation globals
global.unit_fade_step = 1/(room_speed);
global.ai_combat_startup_delay_seconds = 0.5
global.ai_combat_end_sequence_delay_seconds = 0.5

//Control
global.map_running = false;
global.active_side = noone;
global.inactive_side= noone; 
global.ai_turn_in_progress = false;
global.ai_turn_controller = false;
global.ai_turn_completed = true;

//AI behaviour knobs
global.ai_primary_priority_scalar = 100

//GUI globals
global.enemy_stat_card_shift = 1100

//Stat enum
enum combat_type
{
	brutal,
	swift,
	stalwart
};

enum combat_relation
{
	normal,
	weak
};

enum attack_fields
{
	name,
	type,
	range_min,
	range_max,
	strength_weak,
	strength_normal,
	hit_normal,
	hit_weak,
	animation,
	animation_hit_frame
};

enum unit_animation_fields
{
	idle,
	move_ltr,
	move_rtl,
	move_ttb,
	move_btt,
	defender,
	dodge,
	death_attacker,
	death_defender
}

