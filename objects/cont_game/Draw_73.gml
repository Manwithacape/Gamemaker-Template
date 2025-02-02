// ------ DRAW DEBUG MASKS -------
if global.DEBUG {
	
	// draw each collsion mask
	draw_all_masks();
	
	// draw the mouse pos
	draw_set_color(c_white);
	draw_text(mouse_x+10, mouse_y,"(" + string(mouse_x) + ", " + string(mouse_y) + ")")
}

