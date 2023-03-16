extends KinematicBody2D
export (int) var speed = 200
var velocity = Vector2()



func _ready():	
	pass
	
func get_input(): #SW, player movement
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
		#anim.play("RunRight")
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		#anim.play("RunLeft")
	if Input.is_action_pressed("down"):
		velocity.y += 1
		#anim.play("Run")
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		#anim.play("RunUp")

				
	velocity = velocity.normalized() * speed

func _physics_process(delta):
		get_input()
		velocity = move_and_slide(velocity)
