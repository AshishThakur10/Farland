extends Area2D


func _ready():
	pass


func _on_massage_body_entered(body):
	if body.name == 'player':
		$Label.show()
		$Timer.start()
	pass # Replace with function body.


func _on_Timer_timeout():
	$Label.hide()
	pass # Replace with function body.
