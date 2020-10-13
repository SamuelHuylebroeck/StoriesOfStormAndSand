function scr_attack_finish_sequence() {
	with(obj_control)
	{
		scr_show_gui_elements();
	}
	if (global.ai_turn_in_progress != true){
		global.selected.has_acted_this_round = true;
		scr_deselect();
	}else{
		linked_ai_task.alarm=room_speed * global.ai_combat_end_sequence_delay_seconds
	}
	global.combat_animation_playing = false;
	instance_destroy();

}
