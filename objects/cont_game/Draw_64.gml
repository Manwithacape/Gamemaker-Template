/// ------ DRAW THE DEBUG PANEL ------
if global.DEBUG {
	var th = string_height("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
	var p = 10;
	debug_height = array_length(global.DEBUG_STATS)*th;
	debug_x = view_wport[0] - (debug_width+p);

	// draw the debug box
	draw_set_color(c_purple);
	draw_rectangle(debug_x, debug_y, debug_x+debug_width+p, debug_y+debug_height+p, false);
	draw_set_color(c_black);
	draw_rectangle(debug_x, debug_y, debug_x+debug_width+p, debug_y+debug_height+p, true);

	draw_set_color(c_white);
	for (var _i = 0; _i < array_length(global.DEBUG_STATS); _i += 1) {
		var current = global.DEBUG_STATS[_i];
	
		// make sure we are as large as the largest debug value
		if  string_width(current.get_name() + current.get_value_string())+30 > debug_width {
			debug_width = string_width(current.get_name() + current.get_value_string())+30;
		}
	
		// draw the values name on the left
		draw_set_halign(fa_left);
		draw_text((debug_x+p), (debug_y+p) + th*_i, string(current.get_name()));
	
		// draw the values name on the right
		draw_set_halign(fa_right);
		draw_text(debug_x + debug_width, debug_y+p + th*_i, string(current.get_value_string()));
		draw_set_halign(fa_left);
	
		// Draw a line under the value
		if _i != array_length(global.DEBUG_STATS)-1 {
			draw_set_color(c_black)
			draw_line(debug_x, debug_y+p+(th*_i)+th, debug_x+debug_width+p, debug_y+p+(th*_i)+th)	
		}
	}
}
