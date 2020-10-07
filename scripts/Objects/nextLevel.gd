extends Area2D
export var nextlevel = "res://scenes/Levels/Level2.tscn"

func _on_nextLevel_body_entered(body):
	if body.name == 'player':
		get_tree().change_scene(nextlevel)
	pass
