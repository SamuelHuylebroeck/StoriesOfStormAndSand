///@function scr_pixel_y_to_tile_y(pixel)
///@description get the tile y-pos for the passed pixel y-pos
///@param {int} pixel to translate into tile pos

var pixel_y = argument0;
pixel_y -= global.grid_top_startpos;
var tile_y = floor(pixel_y / global.grid_cell_height)
return tile_y;

