extends Node


const NUM_INVENTORY_SLOTS = 5

var inventory = {
	0: ["Bell"],  #--> slot_index: [item_name, item_quantity]
	1: ["Mirror"],  #--> slot_index: [item_name, item_quantity]
	2: ["snow flower"],
	3: ["Slime Potion"],
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
