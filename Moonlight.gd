extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Area2D_mouse_entered():
	#print("mouseEnter")\	
	print(self.name)
	if 	Global.Getcystal== "cystal":
		PlayerInventory.add_item("cystal")
		print("111"+Global.mouseTarget)
		#Global.emit_signal("item_remove")
		Global.mouseTarget = ""
		#print(PlayerInventory.inventory)
		PlayerInventory.item_remove()
		Global.emit_signal("item_remove")
		Global.emit_signal("picked")
		print(PlayerInventory.inventory)
		yield(get_tree().create_timer(0.2),"timeout")
		queue_free()
