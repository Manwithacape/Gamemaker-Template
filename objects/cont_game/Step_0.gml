// ------ TOGGLE DEBUG VIEW ------
if keyboard_check_pressed(vk_home) {
	global.DEBUG = !global.DEBUG;	
}


// ------ GET ANY HOVERED DEBUG INST ------
if global.DEBUG {
	if mouse_check_button_pressed(mb_left) {
		var obj_under_mouse = instance_position(mouse_x, mouse_y, obj_debuggable);
	
		if obj_under_mouse != noone and instance_exists(obj_under_mouse) {
			debug_target_instance = obj_under_mouse;	
		} else {
			debug_target_instance = noone;	
		}
	}
}