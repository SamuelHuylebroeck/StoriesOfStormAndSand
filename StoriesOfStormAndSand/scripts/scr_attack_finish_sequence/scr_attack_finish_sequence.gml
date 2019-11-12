global.selected.has_acted_this_round = true;
with(obj_control)
{
	scr_show_gui_elements();
}
scr_deselect();
instance_destroy();
global.combat_animation_playing = false;