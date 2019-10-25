camera_x = camera_get_view_x(camera);
camera_y = camera_get_view_y(camera);
if (mouse_wheel_down() || keyboard_check_pressed(vk_add))
{
	if(camera_width<max_camera_width)
	{
		camera_width += camera_zoom_step;
		camera_height += camera_zoom_step/aspect_ratio;
		camera_set_view_size(camera,camera_width,camera_height);
		camera_set_view_border(camera,camera_width,camera_height);
	}
}else if (mouse_wheel_up() || keyboard_check_pressed(vk_subtract))
{
	if(camera_width>min_camera_width)
	{
	    camera_width -= camera_zoom_step;
		camera_height -= camera_zoom_step/aspect_ratio;
		camera_set_view_size(camera,camera_width,camera_height);
		camera_set_view_border(camera,camera_width,camera_height);
	}
}