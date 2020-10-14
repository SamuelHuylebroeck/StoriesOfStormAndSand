// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_print_path_to_console(path){
	show_debug_message("Path " + string(path) + " printout")
	var path_size = path_get_number(path)
	for (var i=0; i<path_size; i++){
		var x_point = path_get_point_x(path, i)
		var y_point = path_get_point_y(path, i)
		show_debug_message("Point ["+string(x_point)+ "," +string(y_point)+"]")
	}
}