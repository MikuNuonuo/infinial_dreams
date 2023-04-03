extends Node2D

const n = preload("res://Inventory.tscn")
var selected = false
var mouse_offset
var item_name



# Called when the node enters the scene tree for the first time.
func _ready():
	Global.Getbread = "Beard"
	item_name = "Beard"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
