// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ai_turn_prioirty_modifiers_move_and_attack_task(task, flag_object){
	//Attack modifiers
	var result = scr_ai_turn_priority_modifiers_attack_task(task, true, flag_object)
	//Move modifiers
	result += scr_ai_turn_priority_modifiers_move_task(task, flag_object)
	return result
}