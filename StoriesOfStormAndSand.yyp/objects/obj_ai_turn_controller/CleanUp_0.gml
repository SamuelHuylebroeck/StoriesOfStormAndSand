/// @description Clean up AI turn data structures
// You can write your code in this editor
ds_queue_destroy(ds_active_executors)
ds_active_executors = -1
ds_list_destroy(ds_active_targets)
ds_active_targets = -1
ds_priority_destroy(ds_current_priority_queue)
ds_current_priority_queue = -1