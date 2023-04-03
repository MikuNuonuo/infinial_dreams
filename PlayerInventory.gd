extends Node

const SlotClass = preload("res://Slot.gd")
const NUM_INVENTORY_SLOTS = 5

func _ready():
	pass
	
var inventory = {
	 # slot_index: [item_name]
	#0:"Bell"
	
}

func item_remove():
	print(inventory)
	print("removing!")
	for i in range(5):
		print("startremoving!")
		if inventory.has("Bell"):
			print(111)
			print(inventory.has("Bell"))
			print(inventory[0])
			inventory.erase("Bell")
			print(211)
			queue_free()

	
			


func add_item(item_name):						
	# item doesn't exist in inventory yet, so add it to an empty slot
	for i in range(NUM_INVENTORY_SLOTS):
		if inventory.has(i) == false:
			inventory[i] = item_name
			return
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
