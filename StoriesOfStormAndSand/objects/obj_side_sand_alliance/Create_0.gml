/// @description Insert description here
// You can write your code in this editor
//Config
name="House Of Storms";
controller = states.turn_p_1;
assigned_parent = par_sand_alliance;
icon = spr_symbol_sand_alliance;
//internals
current_turn = 1;
ds_active_units = ds_list_create();
//register units
scr_register_all_assigned_units_in_room();