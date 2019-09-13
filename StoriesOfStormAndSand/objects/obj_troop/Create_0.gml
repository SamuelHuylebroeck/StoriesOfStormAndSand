/// @description Starting Characteristics
// You can write your code in this editor


//Configurable stats
move_points_sqr  = 4;

//Derived stats
move_points_pixels = move_points_sqr * global.grid_cell_width;
move_points_pixels_curr = move_points_pixels;

cur_node_x = x;
cur_node_y = y;