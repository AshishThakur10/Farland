extends RigidBody2D
var bullet_speed = 400


func _ready():
	apply_impulse(Vector2(),Vector2(bullet_speed,0))
	$Bullet_Timer.start()
	pass 
func ouch(var enemyposx):
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

	bullet_speed = 400
	bullet_speed = -400
