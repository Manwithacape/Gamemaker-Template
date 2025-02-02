// ------ GAME VARIABLES AND CONSTANTS ------
global.GRAVITY = 0.3;
global.TIMESCALE = 1;
global.PAUSED = false;
global.CURRENT_FRAME = 0;

// ------ DEBUG SYSTEM ------
global.DEBUG = false;
debug_x = 0;
debug_y = 0;
debug_width = 0;
debug_height = 0;

debug_target_instance = noone;


// this is the array that holds the things that appear in the -purple- panel
global.DEBUG_STATS = [];

// add debug stuff here or where ever
array_push(global.DEBUG_STATS, new Debug_stat("NAME", "VALUE", function() {
	return "";
}));

array_push(global.DEBUG_STATS, new Debug_stat("Frame", "", function() {
	return global.CURRENT_FRAME;
}));

array_push(global.DEBUG_STATS, new Debug_stat("FPS", "fps", function() {
	return fps;
}));

array_push(global.DEBUG_STATS, new Debug_stat("REAL FPS", "", function() {
	return fps_real;
}));

array_push(global.DEBUG_STATS, new Debug_stat("DELTA TIME", "microS", function() {
	return delta_time;
}));

array_push(global.DEBUG_STATS, new Debug_stat("INSTANCES", "", function() {
	return instance_count;
}));

