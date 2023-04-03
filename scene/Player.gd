extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.connect("player_escape",self,"player_escape")


func player_escape():
	$AnimationPlayer.play("escape")
