///@function scr_pixel_x_to_tile_x(pixel)
///@description get the tile x-pos for the passed pixel x-pos
///@param {int} pixel to translate into tile pos

var pixel_x = argument0;
pixel_x -= global.grid_left_startpos;
var tile_x = floor(pixel_x / global.grid_cell_width)
return tile_x;

