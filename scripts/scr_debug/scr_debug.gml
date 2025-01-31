/// @function draw_mask
/// @desc Draws an outline over the mask of the instance for debugging.
/// @param {any} _instance The instance whose mask will be outlined.
/// @param {color} _color The color of the outline (default: `c_red`).
function draw_mask(_instance, _color = c_red) {
    var old_color = draw_get_color();
    draw_set_color(_color);
    draw_rectangle(_instance.bbox_left, _instance.bbox_top, _instance.bbox_right -1, _instance.bbox_bottom-1, true);
    draw_set_color(old_color);
}

/// @function draw_all_masks
/// @desc Draws outlines over the masks of all instances in the room.
/// @param {color} _color The color of the outlines (default: `c_red`).
function draw_all_masks(_color = c_red) {
    for (var _i = 0; _i < instance_count; _i += 1) {
        var object = instance_find(all, _i);
        draw_mask(object);
    }
}

/// @function Debug_stat
/// @desc a struct to hold a debug value update and get that value
/// @param {string} _name the name of the debug value
/// @param {string} _unit the unit of the debug value
/// @param {function} _func a function that can be used to derive the value of this debug value
function Debug_stat(_name, _unit, _func) constructor {
	name = _name;
	unit = _unit;
	func = _func;
	value = 0;
	
	update = function() {
		// value is the result of running function
		value = func();	
	}
	
	get_name = function() {
		return string(name);		
	}
	
	get_value_string = function() {
		update();
		return string(value) + string(unit);
	}
	
	to_string = function() {
		update();
		return string(name) + " : " + string(value) + string(unit);
	}
}