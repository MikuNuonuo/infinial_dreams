extends Node2D

const n = preload("res://Inventory.tscn")
var selected = false
var mouse_offset
var item_name

# Called when the node enters the scene tree for the first time.
func _ready():
	item_name = "Bell"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(delta):
	if selected:
		followMouse()

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		PlayerInventory.add_item(item_name)
		print(item_name)
		queue_free()
		emit_signal("picked")
		

func followMouse():
	position = get_global_mouse_position() + mouse_offset
	


#if event.pressed:
			#mouse_offset = position - get_global_mouse_position()
			#selected = true
		#else:
			#selected = false
