extends Node2D

const n = preload("res://Inventory.tscn")
var selected = false
var mouse_offset
onready var cat_sound = $cat_sound

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(delta):
	if selected:
		followMouse()

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		cat_sound.play()
		

func followMouse():
	position = get_global_mouse_position() + mouse_offset
	


#if event.pressed:
			#mouse_offset = position - get_global_mouse_position()
			#selected = true
		#else:
			#selected = false
