extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var item_name
# Called when the node enters the scene tree for the first time.
func _ready():
	var rand_val = randi() % 3
	if rand_val == 0:
		item_name = "Bell"
	elif rand_val == 1:
		item_name = "Mirror"
	else:
		item_name = "Snowflower"
		
	$TextureRect.texture = load("res://Asset/" + item_name + ".png")		 

func set_item(nm):
	item_name = nm
	$TextureRect.texture = load("res://Asset/" + item_name + ".png")
	

