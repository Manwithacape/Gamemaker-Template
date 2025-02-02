/// @function draw_sprite_dimention
/// @desc Draws a sprite at a specified position with custom dimensions, rotation, color, and alpha.
/// @param {int} _sprite_index - The sprite asset to draw.
/// @param {int} _image_index - The sub-image of the sprite to draw.
/// @param {float} _x - The x-coordinate to draw the sprite.
/// @param {float} _y - The y-coordinate to draw the sprite.
/// @param {float} _width - The desired width of the drawn sprite.
/// @param {float} _height - The desired height of the drawn sprite.
/// @param {float} _rotation - The rotation angle in degrees.
/// @param {int} _color - The color tint to apply.
/// @param {float} _alpha - The transparency (0 to 1).
function draw_sprite_dimention(_sprite_index, _image_index, _x, _y, _width, _height, _rotation, _color, _alpha) {
    var x_scale, y_scale;
    x_scale = _width / sprite_get_width(_sprite_index);
    y_scale = _height / sprite_get_height(_sprite_index);
    draw_sprite_ext(_sprite_index, _image_index, _x, _y, x_scale, y_scale, _rotation, _color, _alpha);
}
