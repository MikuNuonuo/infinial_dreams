extends Node2D


var selected = false
var mouse_offset
var item_name
var ItemClass = preload("res://scene/item.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	item_name = "MaigicNote"

		


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		$MagicNote.visible  = !$MagicNote.visible
		Global.emit_signal("click_sfx")

		

func followMouse():
	position = get_global_mouse_position() + mouse_offset


