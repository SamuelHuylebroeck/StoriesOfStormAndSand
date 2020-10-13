/// @description Check for movement done
// You can write your code in this editor
if(executor.path_index == -1 && task_started){
	show_debug_message("Move part of Move and Attack complete")
	alarm[1] = room_speed * global.ai_combat_startup_delay_seconds;
	task_started=false
}