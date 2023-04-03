extends Node2D

var mouse_offset = Vector2.ZERO

func _input(event):
	#print(get_global_mouse_position())
	followMouse()

func followMouse():
	global_position = get_global_mouse_position() + mouse_offset
