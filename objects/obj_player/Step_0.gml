/// @description Insert description here
// You can write your code in this editor
var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var jump = keyboard_check(vk_space);
// Horizontal Movement
var move_dir = (right - left);
hsp = move_dir*move_speed;

// Vertical Movement
apply_gravity();

if jump and place_meeting(x, y+1, obj_wall) {
	vsp = -10;	
}

collide_with(self, [obj_wall]);