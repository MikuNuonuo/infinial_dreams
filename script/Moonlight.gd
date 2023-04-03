extends Node2D
onready var click_area = $Area2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.






func _on_Area2D_input_event(viewport, event, shape_idx):
		#print("mouseEnter")\	
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		if PlayerInventory.mouse_item == "Mirror":
			PlayerInventory.item_remove("Mirror")
			Global.emit_signal("item_remove","$Area2D")
			click_area.input_pickable = false
			PlayerInventory.add_item("cystal")
			yield(get_tree().create_timer(0.2), "timeout")
			call_deferred("queue_free")
