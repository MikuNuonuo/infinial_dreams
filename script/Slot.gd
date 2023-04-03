extends Panel



var default_tex = preload("res://Asset/hightLight.png")
var empty_tex = preload("res://Asset/itembar.png")

var default_style: StyleBoxTexture = null
var empty_style: StyleBoxTexture = null

var ItemClass = preload("res://scene/item.tscn")
var item = null


func _ready():
	Global.connect("highLight",self,"higtLight_bg")
	default_style = StyleBoxTexture.new()
	empty_style = StyleBoxTexture.new()
	default_style.texture = default_tex
	empty_style.texture = empty_tex
	refresh_style()

func refresh_style():
	if item == null:
		set('custom_styles/panel', empty_style)

		
func pickFromSlot():
	remove_child(item)
	PlayerInventory.mouse_item = item.item_name
	var inventoryNode = find_parent("Inventory")
	inventoryNode.add_child(item)
	item = null
	refresh_style()

func higtLight_bg(style):
	if style == "hightLight":
		set('custom_styles/panel', default_style)
	else:
		set('custom_styles/panel', empty_style)
		
func remove():
	if item == null:
		return
	# if item != null and item.item_name == _item_name:
	else:
		remove_child(item)
		item=null;
		#set('custom_styles/panel', empty_style)
		refresh_style()
	
	
func putIntoSlot(new_item):
	
	item = new_item
	item.position = Vector2(0, 0)
	var inventoryNode = find_parent("Inventory")
	inventoryNode.remove_child(item)
	add_child(item)
	PlayerInventory.mouse_item = ""
	refresh_style()
	
	
func initialize_item(item_name):
	if item == null:
		item = ItemClass.instance()
		item.name = item_name
		add_child(item)
		item.set_item(item_name)
	else:
		print("Item Changed!")
		item.set_item(item_name)
	refresh_style()
