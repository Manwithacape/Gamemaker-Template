/// @function array_2d_create
/// @desc Creates a 2D array with specified width, height, and default value.
/// @param {real} _width - The number of columns in the array.
/// @param {real} _height - The number of rows in the array.
/// @param {any} _value - The default value to fill the array with.
/// @return {array<array<any>>} - A 2D array initialized with the given value.
function array_2d_create(_width, _height, _value = undefined) {
    // Dimensions must be positive return out with an empty 2d array
    if (_width <= 0 || _height <= 0) return array_2d_create(0, 0);
    
    // Create the outer array
    var outer_array = array_create(_height);
    
    // Create an inner array for each element of the outer array with the default value
    for (var _i = 0; _i < _height; _i += 1) {
        var new_inner = array_create(_width, _value);
        outer_array[_i] = new_inner;
    }
    
    // Return the outer array as the 2D array
    return outer_array;
}

/// @function array_to_string
/// @desc Creates a string representation of a given array
/// @param {array<any>} _array - An array to get a string of.
/// @return {string} - A String representation of _array
function array_to_string(_array) {
	// Get a blank string and the length of the array
	var output_string = "[";
	var length = array_length(_array);
	
	// Add each element to the string comma separated
	for (var _i = 0; _i < length; _i += 1) {
		output_string += string(_array[_i]);
		
		//add a comma if not the last element
		if (_i !=  length - 1) { output_string += ", ";};
	}
	
	//add the closing bracket
	output_string += "]";
	
	//return the string
	return string(output_string);
}

/// @function print_array
/// @desc Prints an array to the terminal. 
/// e.g., _label -> [_array[0], _array[1], _array[3]] or, (_label = "") [_array[0], _array[1], _array[3]]
/// @param {array<any>} _array The array to print
/// @param {string} _label A label for the array
function print_array(_array, _label = "") {
	if _label == "" {
		show_debug_message(array_to_string(_array));	
	} else {
		show_debug_message(_label + " -> " +array_to_string(_array));	
	}
}

/// @function array_2d_width
/// @desc Returns the width (number of columns) of a 2D array.
/// @param {array<array<any>>} _array - The 2D array.
/// @return {real} - The width of the 2D array, or 0 if empty.
function array_2d_width(_array) {
    return array_length(_array) > 0 ? array_length(_array[0]) : 0;
}

/// @function array_2d_height
/// @desc Returns the height (number of rows) of a 2D array.
/// @param {array<array<any>>} _array - The 2D array.
/// @return {real} - The height of the 2D array.
function array_2d_height(_array) {
    return array_length(_array);
}

/// @function array_2d_is_jagged
/// @desc Checks if a 2D array is jagged (i.e., rows have different lengths).
/// @param {array<array<any>>} _array - The 2D array.
/// @return {bool} - True if the array is jagged, false otherwise.
function array_2d_is_jagged(_array) {
    if (array_length(_array) == 0) return false;
    var row_length = array_length(_array[0]);
    for (var _i = 1; _i < array_length(_array); _i += 1) {
        if (array_length(_array[_i]) != row_length) return true;
    }
    return false;
}

/// @function array_2d_index_inbounds
/// @desc Checks if the given indices are within the bounds of the 2D array.
/// @param {array<array<any>>} _array - The 2D array.
/// @param {real} _i - The row index.
/// @param {real} _j - The column index.
/// @return {bool} - True if the indices are within bounds, false otherwise.
function array_2d_index_inbounds(_array, _i, _j) {
    return _i >= 0 && _i < array_2d_height(_array) && _j >= 0 && _j < array_2d_width(_array);
}

/// @function array_2d_get_value
/// @desc Retrieves a value from the 2D array at the specified indices.
/// @param {array<array<any>>} _array - The 2D array.
/// @param {real} _i - The row index.
/// @param {real} _j - The column index.
/// @return {any} - The value at the specified indices, or undefined if out of bounds.
function array_2d_get_value(_array, _i, _j) {
    return array_2d_index_inbounds(_array, _i, _j) ? _array[_i][_j] : undefined;
}

/// @function array_2d_set_value
/// @desc Sets a value in the 2D array at the specified indices if they are within bounds.
/// @param {array<array<any>>} _array - The 2D array.
/// @param {real} _i - The row index.
/// @param {real} _j - The column index.
/// @param {any} _value - The value to set.
/// @return {bool} - True if the value was set, false otherwise.
function array_2d_set_value(_array, _i, _j, _value) {
    if (array_2d_index_inbounds(_array, _i, _j)) {
        _array[_i][_j] = _value;
        return true;
    }
    return false;
}

/// @function array_2d_contains
/// @desc Checks if a given value exists in a 2D array.
/// @param {array<array<any>>} _array - The 2D array.
/// @param {any} _value - The value to search for.
/// @return {bool} - True if the value exists in the array, false otherwise.
function array_2d_contains(_array, _value) {
    // Iterate through each row
    for (var _i = 0; _i < array_2d_height(_array); _i += 1) {
        // Iterate through each column in the current row
        for (var _j = 0; _j < array_2d_width(_array); _j += 1) {
            // If the value is found, return true
            if (_array[_i][_j] == _value) {
                return true;
            }
        }
    }
    // If the value was not found, return false
    return false;
}

/// @function array_2d_flatten
/// @desc Flattens a 2D array into a 1D array.
/// @param {array<array<any>>} _array - The 2D array.
/// @return {array<any>} - A 1D array containing all elements of the 2D array.
function array_2d_flatten(_array) {
    // Create an empty array to store the flattened result
    var flattened_array = array_create(0);
    
    // Iterate through each row of the 2D array
    for (var _i = 0; _i < array_2d_height(_array); _i += 1) {
        // Iterate through each element in the current row
        for (var _j = 0; _j < array_2d_width(_array); _j += 1) {
            // Append the current element to the flattened array
            array_push(flattened_array, _array[_i][_j]);
        }
    }
    
    // Return the flattened 1D array
    return flattened_array;
}
