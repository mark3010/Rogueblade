/// @description Insert description here
// You can write your code in this editor

if keyboard_check(ord("T")) {
	flatWidth += 1
}
if keyboard_check(ord("G")) {
	flatWidth -= 1
}

if keyboard_check(ord("Y")) {
	flatRadius += 1
}
if keyboard_check(ord("H")) {
	flatRadius -= 1
}

if keyboard_check(ord("U")) {
	baseWidth += 1
}
if keyboard_check(ord("J")) {
	baseWidth -= 1
}

if keyboard_check(ord("I")) {
	baseRadius += 1
}
if keyboard_check(ord("K")) {
	baseRadius -= 1
}
/*
			flatWidth	= arenas.normal.flatWidth
			flatRadius	= arenas.normal.flatRadius
			baseWidth	= arenas.normal.baseWidth
			baseRadius	= arenas.normal.baseRadius