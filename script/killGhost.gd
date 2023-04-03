extends Node2D




onready var click_area = $Area2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		$ghost_sound.play()
		if PlayerInventory.mouse_item == "drug":
			PlayerInventory.item_remove("drug")
			$throw.play()
			Global.emit_signal("ghost_die")
			Global.emit_signal("item_remove","$Area2D")
			click_area.input_pickable = false
			Global.emit_signal("star_Appear")
			yield(get_tree().create_timer(0.2), "timeout")
			call_deferred("queue_free")

