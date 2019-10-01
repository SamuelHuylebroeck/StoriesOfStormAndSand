/// @function particle_explosion(layer_name, obj_particle, particle_count)
/// @description create a particle explosion at the origin of the calling object
/// @param {string} layer layer to create particles on
/// @param {id} obj_particle particle object id
/// @param {int} particle_count nr of particles to spawn
var layer_name = argument0;
var obj_particle = argument1;
var particle_count = argument2;
repeat(particle_count){
	instance_create_layer(x,y,layer_name,obj_particle)
}