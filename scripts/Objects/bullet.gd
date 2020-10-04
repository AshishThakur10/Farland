extends RigidBody2D
var bullet_speed = 400


func _ready():
	apply_impulse(Vector2(),Vector2(GLOBAL.direction*bullet_speed,0))
	$Bullet_Timer.start()
	pass 
func ouch(var enemyposx,damage):
	queue_free()
	pass

func bounce():
	queue_free()
	pass
func add_coin():
	pass
func _on_Bullet_Timer_timeout():
	queue_free()
	pass 

func _process(delta):
	
	pass
