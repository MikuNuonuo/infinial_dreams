extends Node


const NUM_INVENTORY_SLOTS = 5

var inventory = {
	 # slot_index: [item_name]
	0:"SnowFlower",
	1:"Bell"
}

func add_item(item_name):						
	# item doesn't exist in inventory yet, so add it to an empty slot
	for i in range(NUM_INVENTORY_SLOTS):
		if inventory.has(i) == false:
			inventory[i] = [item_name]
			return
			

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
