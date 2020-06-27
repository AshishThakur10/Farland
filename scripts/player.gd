extends KinematicBody2D

var velocity = Vector2(0,0)
var Gravity= 10
var Speed = 200
var jumpforce = 500

func  _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		velocity.x = -Speed
	elif Input.is_action_pressed("ui_right"):
		velocity.x = Speed
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = -jumpforce
	velocity.x = lerp(velocity.x,0,0.2)
	velocity.y = velocity.y + Gravity
	
	velocity = move_and_slide(velocity,Vector2.UP)