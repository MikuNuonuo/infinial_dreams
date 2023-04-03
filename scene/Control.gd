extends Control

export(int) var minutes = 5
export(int) var seconds = 0
var dseconds = 0

func _ready():
		pass
		
func _physics_process(delta):
	if seconds > 0 and dseconds <=0:
		seconds -= 1
		dseconds = 10
	if minutes > 0 and seconds <=0: 
		minutes -= 1
		seconds = 60
			
	if seconds >= 10:
		$sec.set_text(str(seconds))
	else:
		$sec.set_text("0" + str(seconds))
	if dseconds >= 10:
		$dsec.set_text(str(dseconds))
	else:
		$dsec.set_text("0" + str(dseconds))
		if minutes >= 10 :
				$min.set_text(str(minutes))
		else:
				$min.set_text("0" + str(minutes))
	if minutes == 0 and seconds ==0 and dseconds == 0:
			get_tree().change_scene("res://scene/Lose.tscn")
				


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	dseconds -=1

