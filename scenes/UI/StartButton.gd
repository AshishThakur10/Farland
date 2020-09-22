extends Button

func _ready() -> void:
	pass


func _on_StartButton_pressed() -> void:
	get_tree().change_scene("res://scenes/Levels/Level1.tscn")

func _on_Levels_pressed():
	get_tree().change_scene("res://scenes/UI/Levels.tscn")
	pass 
