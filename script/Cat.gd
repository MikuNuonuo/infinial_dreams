extends Node2D

const n = preload("res://scene/Inventory.tscn")
var selected = false
var mouse_offset
onready var cat_sound = $cat_sound
onready var click_area = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass



func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		cat_sound.play()
		if PlayerInventory.mouse_item == "Bell":
			PlayerInventory.item_remove("Bell")
			Global.emit_signal("item_remove","Bell")
			click_area.input_pickable = false
			yield(cat_sound,"finished")
			PlayerInventory.add_item("Beard")
			# print("111"+Global.mouseTarget)
			#print(PlayerInventory.inventory)
			#Global.emit_signal("item_remove")
			yield(get_tree().create_timer(0.2), "timeout")
			#Global.emit_signal("picked")
			print(PlayerInventory.inventory)
			
			call_deferred("queue_free")
		

func followMouse():
	position = get_global_mouse_position() + mouse_offset
	
	

func _on_Area2D_mouse_entered():
	print("mouseEnter")	
	

