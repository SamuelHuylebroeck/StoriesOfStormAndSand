// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ai_turn_priority_move_and_attack_task(task){
		var attack_priority = scr_ai_turn_priority_attack_task(task)
		var move_priority = scr_ai_turn_priority_move_task_base(task)
		var attack_fraction = 0.9
		return attack_priority * attack_fraction + move_priority * (1- attack_fraction)	
}