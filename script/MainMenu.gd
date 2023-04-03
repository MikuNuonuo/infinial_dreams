extends Control

onready var menu = $Menu
onready var setting = $AudioVedioOptions
onready var level = $Level
onready var ThanksName = $ThanksName


	
func _ready():
	pass
		
		
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		toggle()
		
func toggle():
	visible = !visible
	get_tree().paused = visible
	

# SW, show the Setting and hide the menu
func _on_Setting_pressed():
	$click.play()
	show_and_hide(setting, menu)

	
	
func show_and_hide(first, second):
	first.show()
	second.hide()




func _on_Exit_pressed():
	$click.play()
	get_tree().quit()



func _on_Start2_pressed():
	$click.play()
	toggle()
	get_tree().change_scene("res://scene/Intro.tscn")
	return


func _on_BackfromLevel_pressed():
	$click.play()
	show_and_hide(menu, level)


func _on_BackfromSetting_pressed():
	$click.play()
	show_and_hide(menu, setting)


func _on_FullScreen_toggled(button_pressed):
	$click.play()
	OS.window_fullscreen = button_pressed


func _on_Borderless_toggled(button_pressed):
	$click.play()
	OS.window_borderless = button_pressed
	


func _on_VSync_toggled(button_pressed):
	$click.play()
	OS.vsync_enabled = button_pressed


func _on_Master_value_changed(value):
	$click.play()
	volume(0,value)
	
func volume(bus_index, value):
	$click.play()
	AudioServer.set_bus_volume_db(bus_index, value)


func _on_Music_value_changed(value):
	$click.play()
	volume(1, value)



func _on_Sound_FX_value_changed(value):
	$click.play()
	volume(2, value)


func _on_Thanks_button_up():
	$click.play()
	show_and_hide(ThanksName, menu)
	


func _on_BackfromThanksl_pressed():
	$click.play()
	show_and_hide(menu, ThanksName)


func _on_Thanks_pressed():
	$click.play()
	show_and_hide(ThanksName, menu)

