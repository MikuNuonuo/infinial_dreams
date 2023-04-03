extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var click_area = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		if PlayerInventory.mouse_item == "star":
			$star.play()
			PlayerInventory.item_remove("star")
			Global.emit_signal("item_remove","$Area2D")
			click_area.input_pickable = false
			Global.emit_signal("player_escape")
			yield(get_tree().create_timer(3.2), "timeout")
			get_tree().change_scene("res://scene/Win.tscn")
			

