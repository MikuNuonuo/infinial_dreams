extends Node2D

const n = preload("res://scene/Inventory.tscn")
var selected = false
var mouse_offset
var item_name

# Called when the node enters the scene tree for the first time.
func _ready():
	item_name = "Bell"
	


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		PlayerInventory.add_item(item_name)
		print(PlayerInventory.mouse_item)
		Global.emit_signal("click_sfx")
		#print(item_name)
		
		#Global.emit_signal("picked")
		queue_free()

	#else:Global.mouseTarget = ""
		
		

func followMouse():
	position = get_global_mouse_position() + mouse_offset
	



var mouse_left_down: bool = false

func _process(delta):
		pass
		#var node = get_node_under_cursor()
		#if node and node.name == "mouse_holding_item":
			#print("Mouse is holding item!")
