/// @description Insert description here
// You can write your code in this editor
if(has_acted_this_round)
{
	shader_set(sha_grayscale);
	image_speed = 0.5;
}else
{
	image_speed = 1;
}
draw_self();
shader_reset();