extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("text")
	yield(get_tree().create_timer(1.8), "timeout")
	$Start2.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Start2_pressed():
	$click.play()
	get_tree().change_scene("res://scene/Main.tscn")
