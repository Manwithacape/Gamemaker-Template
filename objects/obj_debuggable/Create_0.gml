// ------ VARIABLES FOR A DEBUGGABLE OBJECT ------

frame_created = global.CURRENT_FRAME;
DEBUG_STATS = [];


array_push(DEBUG_STATS, new Debug_stat("INST", "", function() {
	return id;
}));

array_push(DEBUG_STATS, new Debug_stat("CREATED FRAME", "", function() {
	return frame_created;
}));

array_push(DEBUG_STATS, new Debug_stat("X", "", function() {
	return x;
}));

array_push(DEBUG_STATS, new Debug_stat("Y", "", function() {
	return y;
}));

array_push(DEBUG_STATS, new Debug_stat("WIDTH", "px", function() {
	return sprite_get_width(sprite_index)*image_xscale;
}));

array_push(DEBUG_STATS, new Debug_stat("HEIGHT", "px", function() {
	return sprite_get_height(sprite_index)*image_yscale;
}));
