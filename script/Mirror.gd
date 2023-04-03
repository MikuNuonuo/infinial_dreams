extends Node2D


var selected = false
var mouse_offset
var item_name
var ItemClass = preload("res://item.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	item_name = "Mirror"

		


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		PlayerInventory.add_item("Mirror")
		#print(PlayerInventory.inventory)
		Global.emit_signal("picked")
		Global.Getcystal= "cystal"
		queue_free()

		

func followMouse():
	position = get_global_mouse_position() + mouse_offset


#if event.pressed:
			#mouse_offset = position - get_global_mouse_position()
			#selected = true
		#else:
			#selected = false
