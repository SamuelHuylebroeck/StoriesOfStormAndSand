/// @description Insert description here
// You can write your code in this editor
image_alpha -=image_alpha_dissipation_step;
if(image_alpha <=0){
	instance_destroy();
}
y -= rise_step;
