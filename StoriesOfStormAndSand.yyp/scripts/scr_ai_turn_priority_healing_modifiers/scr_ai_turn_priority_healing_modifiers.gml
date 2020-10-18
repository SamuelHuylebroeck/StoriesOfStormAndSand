// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ai_turn_get_healing_modifiers(relative_health){
	var result = 0
	if(relative_health <= 0.3){		
		//When less than 30% health
		result += 600
	
	}else if (relative_health <= 0.5) {
		//Between 30% and 50%
		result += 400
	
	}else if (relative_health <= 0.8) { 
		//Between 50% and 80%
		result += 150
	}else {
		result += 0
	}
	return result 
}