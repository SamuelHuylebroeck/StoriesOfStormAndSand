/// @description Initialization
// You can write your code in this editor

//Config
name="House Of Storms";
controller = states.turn_p_1;
assigned_parent = par_storm_house;
icon = spr_symbol_hos;
//internals
current_turn = 1;
ds_active_units = ds_list_create();
active = true;
