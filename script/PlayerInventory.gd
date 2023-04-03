extends Node

const SlotClass = preload("res://script/Slot.gd")
const NUM_INVENTORY_SLOTS = 5

var mouse_item = "" # MOUSE TARGET

func _ready():
	pass
	
var inventory = {
	 # slot_index: [item_name]
	#0:"Bell"
}

func item_remove(item_name):
	for i in range(NUM_INVENTORY_SLOTS):
		if inventory.has(i):
			if inventory[i] == item_name:
				inventory.erase(i)
				Global.emit_signal("item_remove",item_name)
				return


func add_item(item_name):						
	# item doesn't exist in inventory yet, so add it to an empty slot
	for i in range(NUM_INVENTORY_SLOTS):
		if inventory.has(i) == false:
			inventory[i] = item_name
			Global.emit_signal("picked")
			return
			


