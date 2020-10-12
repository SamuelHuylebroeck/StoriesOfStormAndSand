function scr_pan() {
	//get current camera positions
	var camera_x = camera_get_view_x(camera);
	var camera_y = camera_get_view_y(camera);

	var camera_width = camera_get_view_width(camera);
	var camera_height = camera_get_view_height(camera);
	if(keyboard_check(ord(global.up)) and camera_y > 0 )
	{
		camera_y -= camera_pan_step;
	}

	if(keyboard_check(ord(global.down)) and camera_y < room_height - camera_height)
	{
		camera_y += camera_pan_step;
	}

	if(keyboard_check(ord(global.left)) and camera_x> 0)
	{
		camera_x -= camera_pan_step;
	}

	if(keyboard_check(ord(global.right))  and camera_x < room_width - camera_width)
	{
		camera_x += camera_pan_step;
	}


	camera_set_view_pos(camera,camera_x,camera_y);



}
