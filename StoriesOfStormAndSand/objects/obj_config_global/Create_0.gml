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

//Querty Azerty stuff
azerty = true;
global.up = azerty?"Z":"W";
global.left = azerty?"Q":"A";
global.down = "S";
global.right = "D";

