extends KinematicBody2D
const bullet = preload("res://scenes/Instance/bullet.tscn")

onready var sprite =$AnimatedSprite
var velocity = Vector2(0,0)
var Gravity= 18
var Speed = 300
var jumpforce = 700
var coin = 0
var current
var max_hp = 100
var car = true
var BULLET_VELOCITY = 400
func _ready():
	current = max_hp

func  _physics_process(delta):
	
	player_movemen() 
	jump()
	monstarcar()

func player_movemen():
	if Input.is_action_just_pressed("Fire"):
		Shoot()
	if Input.is_action_pressed("ui_left"):
		GLOBAL.direction = -1
		velocity.x = -Speed
		$AnimatedSprite.flip_h = true
		$turn.rotation_degrees = 180
		$AnimatedSprite.play("walk")


	elif Input.is_action_pressed("ui_right"):
		GLOBAL.direction = 1
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

func ouch(var enemyposx,damage):
	$Timer.start()
	set_modulate(Color(1,0.3,0.3,0.3))
	if position.x < enemyposx:
		velocity.x = -500
	elif position.x > enemyposx:
		velocity.x = 500
	
	Input.action_release("ui_left")
	Input.action_release("ui_right")
	current -= damage
	get_node("CanvasLayer/HealthBar2").value = int(float(current)/max_hp*100)
	if current == 0:
		queue_free()

func Shoot():
	var bullet_instance = bullet.instance()
	$turn/aim/CPUParticles2D.set_emitting(true)
	$turn/aim/CPUParticles2D/gunshot.start()
	
	bullet_instance.position = $turn/aim.get_global_position()
	get_parent().add_child(bullet_instance)
	pass

func monstarcar():
	if Input.is_action_just_pressed("ui_accept"):
		car = true
		$monstarcar.set_visible(car) 
	if Input.is_action_just_pressed("ui_cancel"):
		car = false
		$monstarcar.set_visible(car)

func _on_Health_depleted():
	
	
	die()
	pass 
func die():
	
	queue_free()
	pass


func _on_Timer_timeout():
	set_modulate(Color(1,1,1,1))
	pass 


func _on_gunshot_timeout():
#	$CPUParticles2D.set_emitting(false)
	pass # Replace with function body.
