
/// @function applies gravity to the calling object
function apply_gravity() {
	if !place_meeting(x, y+1, obj_wall) {
		vsp += global.GRAVITY;
	}
}



/// @function place_meeting_multiple
/// @param {real} _x 
/// @param {real} _y
/// @param {array} _objects
function place_meeting_multiple(_x, _y, _objects) {
    for (var i = 0; i < array_length(_objects); i++) {
        if (place_meeting(_x, _y, _objects[i])) {
            return true;
        }
    }
    return false;
}

/// @function collide_with
/// @desc Handles movement and collision for an object against multiple object types.
/// @param {instance} _who The instance that is being moved and checked for collisions.
/// @param {array} _collide_with An array of object types that `_who` should collide with.
function collide_with(_who, _collide_with) {
    // Collide Horizontally
    if (place_meeting_multiple(_who.x + _who.hsp, _who.y, _collide_with)) {
        while (!place_meeting_multiple(_who.x + sign(_who.hsp), _who.y, _collide_with)) {
            _who.x += sign(_who.hsp);
        }
        _who.hsp = 0;
    }
    
    // Move horizontally
    _who.x += _who.hsp;

    // Collide Vertically
    if (place_meeting_multiple(_who.x, _who.y + _who.vsp, _collide_with)) {
        while (!place_meeting_multiple(_who.x, _who.y + sign(_who.vsp), _collide_with)) {
            _who.y += sign(_who.vsp);
        }
        _who.vsp = 0;
    }

    // Move vertically
    _who.y += _who.vsp;
}
/*
/// @function collide_with
/// @desc Handles movement and collision for an object against multiple object types, supporting fractional speeds.
/// @param {instance} _who The instance that is being moved and checked for collisions.
/// @param {array} _collide_with An array of object types that `_who` should collide with.
function collide_with(_who, _collide_with) {
    var hsp_remaining = _who.hsp;
    var vsp_remaining = _who.vsp;
    
    // Step through horizontal movement
    while (abs(hsp_remaining) > 0.001) { // Small threshold to prevent floating-point errors
        var step = min(abs(hsp_remaining), 1) * sign(hsp_remaining);
        if (!place_meeting_multiple(_who.x + step, _who.y, _collide_with)) {
            _who.x += step;
            hsp_remaining -= step;
        } else {
            _who.hsp = 0;
            break;
        }
    }

    // Step through vertical movement
    while (abs(vsp_remaining) > 0.001) {
        var step = min(abs(vsp_remaining), 1) * sign(vsp_remaining);
        if (!place_meeting_multiple(_who.x, _who.y + step, _collide_with)) {
            _who.y += step;
            vsp_remaining -= step;
        } else {
            _who.vsp = 0;
            break;
        }
    }
}

*/
