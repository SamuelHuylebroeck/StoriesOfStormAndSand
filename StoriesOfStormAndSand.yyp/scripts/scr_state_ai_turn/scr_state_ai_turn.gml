// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_state_ai_turn(){
	
	show_debug_message("Hello there from the AI turn")
	
	if(global.ai_turn_in_progress == false){
		show_debug_message("Creating controller")
		global.ai_turn_in_progress=true
		global.ai_turn_completed=false
		ai_turn_controller = instance_create_layer(obj_ai_turn_controller, "Logic",0,0)
		global.ai_turn_controller = ai_turn_controller
		with(global.ai_turn_controller){
			
		}
	}
		
	
	if (global.ai_turn_completed==true){
		global.ai_turn_completed=false
		global.ai_turn_in_progress=false
		instance_destroy(global.ai_turn_controller)
		global.ai_turn_controller = noone
		scr_next_turn()
	}
}