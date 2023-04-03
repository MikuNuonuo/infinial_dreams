extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var item_name
onready var click_area = $Area2D

func _ready():
	item_name = "drug"
