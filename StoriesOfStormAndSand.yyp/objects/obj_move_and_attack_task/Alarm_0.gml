/// @description End move and attack task
// You can write your code in this editor
show_debug_message("Attack part of Move and Attack done")
controller.executing_task = false;
executor.has_acted_this_round = true;
instance_destroy()