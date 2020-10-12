function scr_toggle_visibility_gui_elements() {
	var size = ds_list_size(ds_gui_elements);

	for(var i = 0; i<size; i++)
	{
		var element = ds_gui_elements[| i];
		element.visible = !element.visible;
	}


}
