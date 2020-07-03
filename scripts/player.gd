extends KinematicBody2D

var velocity = Vector2(0,0)
var Gravity= 18
var Speed = 300
var jumpforce = 700
var coin = 0

func  _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		velocity.x = -Speed
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("walk")
		
	elif Input.is_action_pressed("ui_right"):
		velocity.x = Speed
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("walk")
	else:
		$AnimatedSprite.play("idel")
	if not is_on_floor():
		$AnimatedSprite.play("jump")
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = -jumpforce
		
	velocity.x = lerp(velocity.x,0,0.2)
	velocity.y = velocity.y + Gravity
	
	velocity = move_and_slide(velocity,Vector2.UP)


func _on_fallzone_body_entered(body: Node) -> void:
	get_tree().change_scene("res://scenes/Levels/Level1.tscn")

func add_coin():
	coin = coin + 1
	pass
