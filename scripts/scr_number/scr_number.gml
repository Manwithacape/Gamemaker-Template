/// @function map_value
/// @desc Maps a value from one range to another.
/// @param {real} _value - The input value to be mapped.
/// @param {real} _in_min - The minimum value of the input range.
/// @param {real} _in_max - The maximum value of the input range.
/// @param {real} _out_min - The minimum value of the output range.
/// @param {real} _out_max - The maximum value of the output range.
/// @return {real} - The mapped value.
function map_value(_value, _in_min, _in_max, _out_min, _out_max) {
    return _out_min + ((_value - _in_min) * (_out_max - _out_min) / (_in_max - _in_min));
}