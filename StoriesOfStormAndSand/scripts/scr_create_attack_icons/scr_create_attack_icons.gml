//Attack icon creation

var current_player_parent = scr_get_active_side_par();
var target = scr_select_nearest_enemy(x,y,current_player_parent);
ds_possible_attacks = ds_list_create();
if(global.selected != noone && target !=noone)
{
	var attack_list = global.selected.ds_attack_list;
	for (var i = 0; i<ds_list_size(attack_list);i++)
	{
		if(scr_attack_in_range(global.selected,target,attack_list[| i]))
		{
			ds_list_add(ds_possible_attacks, attack_list[| i]);
		}
	}
}
else
{
	show_debug_message("move target object created without a target object in range");
}

//Creating the attack icons
var pos_x = x + sprite_width/2;
var pos_y = y;
if(ds_list_size(ds_possible_attacks) >1)
{
pos_y -= (sprite_height);
}
else
{
	pos_y -= sprite_height/4; 
}

for(var i = 0; i <ds_list_size(ds_possible_attacks);i++)
{
	var attack = ds_possible_attacks[| i];
	var attack_init_obj = instance_create_layer(pos_x,pos_y,"Gui",obj_attack_init);
	attack_init_obj.initiating_unit = global.selected;
	attack_init_obj.target_unit = target;
	attack_init_obj.assigned_attack = attack;
	var new_icon = scr_select_icon(attack[attack_fields.type]);
	attack_init_obj.sprite_index = new_icon;
	pos_y += attack_init_obj.scale_factor* attack_init_obj.sprite_height + margin_y;
}