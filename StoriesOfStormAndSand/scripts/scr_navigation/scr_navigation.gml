/// @function scr_navigation(start_x,start_y,end_x,end_y)
/// @description Move an object from start to end
var start_x = argument0;
var start_y = argument1;
var end_x = argument2;
var end_y = argument3;

if(!mp_grid_path(global.map_grid, global.navigate, start_x,start_y,end_x,end_y,global.path_allow_diag))
{
	show_message("Unable to navigate");
	return false;
}
else
{
	mp_grid_path(global.map_grid, global.navigate, start_x,start_y,end_x,end_y,global.path_allow_diag);
	path_start(global.navigate, global.path_move_speed,0 ,false);
	return true;
}