extends Node2D


onready var timer := $Timer
onready var label := $countDown

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.connect("timeout", label, "toggle_visibility")
	
func _on_timer_timeout():
	get_tree().change_scene("res://scene/Lose.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	get_tree().change_scene("res://scene/Lose.tscn")
