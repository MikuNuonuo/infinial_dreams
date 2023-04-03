extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var animation_player = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.connect("star_Appear",self,"starAppear")


func starAppear():
	$star.visible = true
	$Area2D.visible = true
	$AnimationPlayer.play("appear")
	$ding.play()
	yield(animation_player, "animation_finished")
	
	
	
func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		PlayerInventory.add_item("star")
		queue_free()
