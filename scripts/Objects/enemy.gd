extends KinematicBody2D
var velocity = Vector2()
var speed = 50
export var direction = 1
export var detects_cliffs = true

func _ready() -> void:
	if direction == 1 :
		$AnimatedSprite.flip_h = true
	$"floor-checker".position.x = $CollisionShape2D.shape.get_extents().x * direction
	$"floor-checker".enabled = detects_cliffs
	pass

func _physics_process(delta: float) -> void:
	if is_on_wall() or not $"floor-checker".is_colliding() and detects_cliffs and is_on_floor():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$"floor-checker".position.x = $CollisionShape2D.shape.get_extents().x * direction
	
	velocity.y += 20
	velocity.x = speed * direction
	
	velocity = move_and_slide(velocity,Vector2.UP)
	pass


func _on_top_checker_body_entered(body: Node) -> void:
	$AnimatedSprite.play("squashed")
	$squash.play()
	speed = 0
	set_collision_layer_bit(4,false)
	set_collision_mask_bit(0,false)
	$top_checker.set_collision_layer_bit(4,false)
	$top_checker.set_collision_mask_bit(0,false)
	$side_checker.set_collision_layer_bit(4,false)
	$side_checker.set_collision_mask_bit(0,false)
	$Timer.start()
	body.bounce()
	pass


func _on_side_checker_body_entered(body: Node) -> void:
	print('hit')
	body.ouch(position.x)


func _on_Timer_timeout() -> void:
	queue_free()

