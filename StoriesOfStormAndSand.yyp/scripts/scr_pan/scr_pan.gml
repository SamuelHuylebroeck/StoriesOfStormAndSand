function scr_pan() {
	//get current camera positions
	var camera_x = camera_get_view_x(camera);
	var camera_y = camera_get_view_y(camera);

	var camera_width = camera_get_view_width(camera);
	var camera_height = camera_get_view_height(camera);
	var up_pressed = keyboard_check(ord(global.up)) or keyboard_check(vk_up)
	var down_pressed = keyboard_check(ord(global.down)) or keyboard_check(vk_down)
	var left_pressed = keyboard_check(ord(global.right)) or keyboard_check(vk_left)
	var right_pressed = keyboard_check(ord(global.right)) or keyboard_check(vk_right)

	
	if(up_pressed and camera_y > 0 )
	{
		camera_y -= camera_pan_step;
	}

	if(down_pressed and camera_y < room_height - camera_height)
	{
		camera_y += camera_pan_step;
	}

	if(left_pressed and camera_x> 0)
	{
		camera_x -= camera_pan_step;
	}

	if(right_pressed  and camera_x < room_width - camera_width)
	{
		camera_x += camera_pan_step;
	}

	camera_set_view_pos(camera,camera_x,camera_y);

}
