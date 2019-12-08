/// @description Insert description here
// You can write your code in this editor
global.map_grid = mp_grid_create(global.grid_left_startpos,global.grid_top_startpos,
					global.grid_nr_h_cells, global.grid_nr_v_cells,
					global.grid_cell_width,global.grid_cell_height);
global.navigate = path_add();