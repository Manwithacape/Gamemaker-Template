/// ------ DRAW THE DEBUG PANEL ------
if global.DEBUG {
	
	// ------ GLOBAL DEBUG PANEL ------
	// Set up some variables to make drawing stright forward
	var th = string_height("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
	var p = 10;
	debug_height = array_length(global.DEBUG_STATS)*th;
	debug_x = view_wport[0] - (debug_width+p);

	// draw the debug box -purple- box -black- outline
	draw_set_color(c_purple);
	draw_rectangle(debug_x, debug_y, debug_x+debug_width+p, debug_y+debug_height+p, false);
	draw_set_color(c_black);
	draw_rectangle(debug_x, debug_y, debug_x+debug_width+p, debug_y+debug_height+p, true);

	// white text
	for (var _i = 0; _i < array_length(global.DEBUG_STATS); _i += 1) {
		var current = global.DEBUG_STATS[_i];
	
		// make sure we are as large as the largest debug value
		if  string_width(current.get_name() + current.get_value_string())+30 > debug_width {
			debug_width = string_width(current.get_name() + current.get_value_string())+30;
		}
	
		// draw the values name on the left
		draw_set_color(c_white);
		draw_set_halign(fa_left);
		draw_text((debug_x+p), (debug_y+p) + th*_i, string(current.get_name()));
	
		// draw the values name on the right
		draw_set_halign(fa_right);
		draw_text(debug_x + debug_width, debug_y+p + th*_i, string(current.get_value_string()));
		draw_set_halign(fa_left);
	
		// Draw a line under the value - closes the tabel cell
		if _i != array_length(global.DEBUG_STATS)-1 {
			draw_set_color(c_black)
			draw_line(debug_x, debug_y+p+(th*_i)+th, debug_x+debug_width+p, debug_y+p+(th*_i)+th)	
		}
	}
	
	// ------ INSTANCE DEBUG PANEL ------
	// if an object exists
	if debug_target_instance != noone and instance_exists(debug_target_instance) {
		// get the target
		var t = debug_target_instance;
		
		
		var iy = debug_height+(p*2);
		var iw = 0;
		var ih = array_length(t.DEBUG_STATS)*th;
		
		
		// find the longest string length is the debug list
		for (var _i = 0; _i < array_length(t.DEBUG_STATS); _i += 1) {
			var current = t.DEBUG_STATS[_i]; 
			var current_length = string_width(current.get_name() + current.get_value_string())
			if current_length > iw {
				iw = current_length	
			}
		}
		iw += 30;
		var ix = view_wport[0]-(iw+p);
		var iheaderh = iw;
		
		//draw a box for the text to go in
		draw_set_color(c_blue) 
		draw_rectangle(ix, iy, ix+iw+p, iy+ih+p, false)
		draw_set_color(c_black) 
		draw_rectangle(ix, iy, ix+iw+p, iy+ih+p, true)
		
		// draw t's sprite
		//draw_sprite_dimention(t.sprite_index, t.image_index, ix+p, iy+p, ix+iw-p, ix+iw-p, 0, c_white, 1);
		
		//draw each debug value
		for (var _i = 0; _i < array_length(t.DEBUG_STATS); _i += 1) {
			var current = t.DEBUG_STATS[_i]; 
			// draw the values name on the left
			draw_set_color(c_white);
			draw_set_halign(fa_left);
			draw_text((ix+p), (iy+p) + th*_i, string(current.get_name()));
	
			// draw the values name on the right
			draw_set_halign(fa_right);
			draw_text(ix + iw, iy+p + th*_i, string(current.get_value_string()));
			draw_set_halign(fa_left);	
			
			// Draw a line under the value - closes the tabel cell
			if _i != array_length(t.DEBUG_STATS)-1 {
				draw_set_color(c_black)
				draw_line(ix, iy+p+(th*_i)+th, ix+iw+p, iy+p+(th*_i)+th);	
			}
		}
		
		//draw a line from t to the info box
		draw_set_color(c_blue);
		draw_line(ix, iy, t.x, t.y);
		
		//set the text to white
		draw_set_color(c_white);
	}
}
