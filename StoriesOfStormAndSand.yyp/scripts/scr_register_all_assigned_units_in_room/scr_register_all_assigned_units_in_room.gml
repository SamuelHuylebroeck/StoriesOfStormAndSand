function scr_register_all_assigned_units_in_room() {
	//register units
	with(assigned_parent)
	{
		ds_list_add(other.ds_active_units,self);
	}
}
