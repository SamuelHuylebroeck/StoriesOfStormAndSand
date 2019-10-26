/// @function scr_select_icon(type);
/// @description returns the icon sprite for the passed type
/// @param {combat_type} type brutal, swift or stalwart

var type = argument0;

switch(type)
{
	case combat_type.brutal:
		return spr_brutal_fist;
	case combat_type.swift:
		return spr_swift_waves;
	case combat_type.stalwart:
		return spr_stalwart_shield;
}
