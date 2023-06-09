extends Node2D


const SlotClass = preload("res://Slot.gd")
onready var inventory_slots = $GridContainer
var holding_item = null


# Called when the node enters the scene tree for the first time.
func _ready():
	for inv_slot in inventory_slots.get_children():
		inv_slot.connect("gui_input", self,"slot_gui_input",[inv_slot])
	initialize_inventory()
	Global.connect("picked",self,"initialize_inventory")
	#Global.connect("Global.item_remove",self,"remove")
		
func initialize_inventory():
	var slots = inventory_slots.get_children()
	for i in range(slots.size()):
		if PlayerInventory.inventory.has(i):
			slots[i].initialize_item(PlayerInventory.inventory[i])
			
#func remove():
	#var slots = inventory_slots.get_children()
	#for i in range(slots.size()):
	#if PlayerInventory.inventory.has("Bell"):
			#slots.erase("Bell")
			
func slot_gui_input(event: InputEvent, slot: SlotClass):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed:
			if holding_item != null:
				if !slot.item:
					slot.putIntoSlot(holding_item)
					holding_item =null
				else:
					var temp_item = slot.item
					slot.pickFromSlot()
					temp_item.global_position = event.global_position
					slot.putIntoSlot(holding_item)
					holding_item = temp_item
			elif slot.item:
				holding_item = slot.item
				slot.pickFromSlot()
				holding_item.global_position = get_global_mouse_position()

func _input(event):
	if holding_item:
		holding_item.global_position = get_global_mouse_position()
		
