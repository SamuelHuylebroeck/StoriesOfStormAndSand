/// @function scr_deal_damage(initial_damage)
/// @description resolve damage for this unit, factoring in its defenses
/// @param {real} initial_damage damage before defenses

var initial_damage = argument0;

var reduced_damage = initial_damage - stats_defence;
if(reduced_damage >0){
	stats_current_hp -= reduced_damage;
	var inst = instance_create_layer(x+irandom(global.grid_cell_width),y,"Logic",obj_damage_number);
	inst.damage_text = string(reduced_damage);
	if(stats_current_hp<= 0){
		sprite_index = anim_death;
	}
}else{
	scr_particle_explosion("Animation",obj_miss_particle,10);
}