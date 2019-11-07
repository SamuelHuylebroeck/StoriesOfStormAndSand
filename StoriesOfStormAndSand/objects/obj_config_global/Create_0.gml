/// @description Assign globals

// Grid globals
global.grid_left_startpos = 32;
global.grid_top_startpos = 32;
global.grid_nr_h_cells = 25;
global.grid_nr_v_cells = 25;
global.grid_cell_width = 64;
global.grid_cell_height = 64;

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
azerty = true;
global.up = azerty?"Z":"W";
global.left = azerty?"Q":"A";
global.down = "S";
global.right = "D";

//camera control
global.camera_controllable = true;

//animation globals
global.unit_fade_step = 1/(room_speed);

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
	move_left,
	move_right,
	move_up,
	move_down,
	defender,
	dodge,
	death_attacker,
	death_defender
}

