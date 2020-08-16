extends KinematicBody2D
var velocity = Vector2()
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
	velocity.x = 50 * direction
	
	velocity = move_and_slide(velocity,Vector2.UP)
	pass
