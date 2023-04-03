extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var animation_player = $Ghost

# Called when the node enters the scene tree for the first time.
func _ready():
	$Ghost.play("idle")
	Global.connect("ghost_die",self,"GhostDie")
	
func GhostDie():
	$Ghost.play("die")
	yield(animation_player, "animation_finished")
	queue_free()

