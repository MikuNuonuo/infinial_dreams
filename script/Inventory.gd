extends Node2D


const SlotClass = preload("res://script/Slot.gd")
onready var inventory_slots = $GridContainer
var holding_item = null


# Called when the node enters the scene tree for the first time.
func _ready():
	for inv_slot in inventory_slots.get_children():
		inv_slot.connect("gui_input", self,"slot_gui_input",[inv_slot])
	initialize_inventory()
	Global.connect("picked",self,"initialize_inventory")
	Global.connect("item_remove",self,"remove")
	Global.connect("click_sfx",self,"ClickPlay")
	

func ClickPlay():
	$click.play()
		
func initialize_inventory():
	var slots = inventory_slots.get_children()
	for i in range(slots.size()):
		if PlayerInventory.inventory.has(i):
			slots[i].initialize_item(PlayerInventory.inventory[i])
		elif not PlayerInventory.inventory.has(i) and (slots[i].item != null) :
			slots[i].remove()

		
func remove(item_name):
	if holding_item != null:
		remove_child(holding_item)
		PlayerInventory.mouse_item = ""
		holding_item.queue_free()
		holding_item = null
	else:
		var slots = inventory_slots.get_children()
		for i in range(slots.size()):
			if slots[i].item != null and slots[i].item.item_name == item_name:
				slots[i].remove()
				
func slot_gui_input(event: InputEvent, slot: SlotClass):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed:
			$click.play()
			if holding_item != null:
				if !slot.item:
					slot.putIntoSlot(holding_item)
					holding_item =null
				elif (holding_item.get_name() == "cystal" and slot.item.get_name() == "SnowFlower") or (holding_item.get_name() == "SnowFlower" and slot.item.get_name() =="cystal"):
					holding_item.queue_free()
					holding_item = null	
					combine_item("cystal", "SnowFlower", "BluePotion")
				elif (holding_item.get_name() == "BluePotion" and slot.item.get_name() == "Beard") or (holding_item.get_name() == "Beard" and slot.item.get_name() == "BluePotion"):
					holding_item.queue_free()
					holding_item = null	
					combine_item("BluePotion", "Beard", "drug")	
				elif (holding_item.get_name() == "cystal" and slot.item.get_name() == "Beard") or (holding_item.get_name() == "Beard" and slot.item.get_name() == "cystal"):
					holding_item.queue_free()
					holding_item = null	
					combine_item("cystal", "Beard", "YellowPotion")	
				elif (holding_item.get_name() == "YellowPotion" and slot.item.get_name() == "SnowFlower") or (holding_item.get_name() == "SnowFlower" and slot.item.get_name() == "YellowPotion"):
					holding_item.queue_free()
					holding_item = null	
					combine_item("YellowPotion", "SnowFlower", "drug")
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
		
func combine_item(item1, item2, newitem):
	PlayerInventory.item_remove(item1)
	PlayerInventory.item_remove(item2)
	PlayerInventory.add_item(newitem)
	yield(get_tree().create_timer(0.2), "timeout")

