///@function 
///@description 
function scr_combat_camera_apply() {
	var combat_camera_height = combat_camera_width / aspect_ratio;
	camera_set_view_size(camera,combat_camera_width,combat_camera_height);
	camera_set_view_border(camera,camera_width,camera_height);
	//Correction for zoom out
	var combat_camera_x = camera_get_view_x(camera);
	var combat_camera_y = camera_get_view_y(camera);
	if(combat_camera_x > room_width - combat_camera_width)
	{
		combat_camera_x = room_width - combat_camera_width;
	}
	if(combat_camera_y >room_height - combat_camera_height)
	{
		combat_camera_y = room_height - combat_camera_height;
	}
	combat_camera_x = combat_camera_x <0 ? 0 : combat_camera_x;
	combat_camera_y = combat_camera_y <0 ? 0 : combat_camera_y;
	camera_set_view_pos(camera, combat_camera_x,combat_camera_y);




}
