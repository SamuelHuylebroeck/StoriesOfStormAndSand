/// @description Create the grid
// You can write your code in this editor
var left = 48;
var top = 112;
var h_cells = 17;
var v_cells = 7;
var cell_width = 32;
var cell_height = 32;

global.map_grid = mp_grid_create(left,top,h_cells,v_cells,cell_width,cell_height);
global.navigate = path_add();