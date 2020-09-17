extends KinematicBody2D
var bullet = preload("res://scenes/Instance/bullet.tscn")

var velocity = Vector2(0,0)
var Gravity= 18
var Speed = 300
var jumpforce = 700
var coin = 0

func  _physics_process(delta):
	Shoot()
	player_movemen()
	jump()

func player_movemen():
	if Input.is_action_pressed("ui_left"):
		
		velocity.x = -Speed
		$AnimatedSprite.flip_h = true
		$turn.rotation_degrees = 180
		$AnimatedSprite.play("walk")

	elif Input.is_action_pressed("ui_right"):
		
		velocity.x = Speed
		$turn.rotation_degrees = 0
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("walk")
	else:
		$AnimatedSprite.play("idel")
	if not is_on_floor():
		$AnimatedSprite.play("jump")
	
	velocity.x = lerp(velocity.x,0,0.2)
	velocity.y = velocity.y + Gravity
	velocity = move_and_slide(velocity,Vector2.UP)

func  jump():
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = -jumpforce
		$SoundJump.play()

func _on_fallzone_body_entered(body: Node) -> void:
	get_tree().change_scene("res://scenes/UI/GameOver.tscn")

func add_coin():
	coin = coin + 1
	pass

func bounce():
	velocity.y = jumpforce * 0.7
	pass

func ouch(var enemyposx):
	set_modulate(Color(1,0.3,0.3,0.3))
	if position.x < enemyposx:
		velocity.x = -500
	elif position.x > enemyposx:
		velocity.x = 500
	
	Input.action_release("ui_left")
	Input.action_release("ui_right")

func Shoot():
	var timer = $bullet_timer
	var bullet_instance = bullet.instance()
	if Input.is_action_just_pressed("Fire"):
		print('fire')
		bullet_instance.position = $turn/aim.get_global_position()
		get_parent().add_child(bullet_instance)
	pass
