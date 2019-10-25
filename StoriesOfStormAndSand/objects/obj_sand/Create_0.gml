/// @description Insert description here
// You can write your code in this editor
var is_busy = irandom(100) < global.busy_percentage;
sprite_index = is_busy? choose(spr_desert_foilage_1,spr_desert_busy_1) : choose(spr_desert_sparse_1,spr_desert_sparse_2);