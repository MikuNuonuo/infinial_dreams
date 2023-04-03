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

	

func _on_Area2D_mouse_entered():
	#print("mouseEnter")\	
	if Global.mouseTarget == "Bell":
		PlayerInventory.add_item("Beard")
		print("111"+Global.mouseTarget)
		#Global.emit_signal("item_remove")
		Global.mouseTarget = ""
		#print(PlayerInventory.inventory)
		PlayerInventory.item_remove()
		#Global.emit_signal("item_remove")
		Global.emit_signal("picked")
		print(PlayerInventory.inventory)
		yield(get_tree().create_timer(0.2),"timeout")
		queue_free()

