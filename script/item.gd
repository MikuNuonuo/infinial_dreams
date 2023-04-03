extends Node2D



var item_name
# Called when the node enters the scene tree for the first time.
func _ready():

	pass

func set_item(nm):
	item_name = nm
	name = nm
	$TextureRect.texture = load("res://Asset/" + item_name + ".png")
	

