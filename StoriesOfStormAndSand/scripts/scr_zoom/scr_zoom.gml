if (mouse_wheel_down() || keyboard_check_pressed(vk_add))
{
	if(camera_width<max_camera_width)
	{
		camera_width += camera_zoom_step;
		camera_height += camera_zoom_step/aspect_ratio;
		camera_set_view_size(camera,camera_width,camera_height);
		camera_set_view_border(camera,camera_width,camera_height);
		//Correction for zoom out
		camera_x = camera_get_view_x(camera);
		camera_y = camera_get_view_y(camera);
		if(camera_x > room_width - camera_width)
		{
			camera_x = room_width - camera_width;
		}
		if(camera_y >room_height - camera_height)
		{
			camera_y = room_height - camera_height;
		}
		camera_x = camera_x <0 ? 0 : camera_x;
		camera_y = camera_y <0 ? 0:camera_y;
		camera_set_view_pos(camera, camera_x,camera_y);
		
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