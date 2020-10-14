// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_start_move_task(){
	var path = self.path
	with(executor){
		scr_print_path_to_console(path)
		path_start(path, global.path_move_speed, path_action_stop ,false);
	}
	task_started=true;
}