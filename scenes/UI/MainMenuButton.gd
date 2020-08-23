extends Button

func _ready() -> void:
	pass


func _on_MainMenu_pressed() -> void:
	get_tree().change_scene("res://scenes/UI/MainMenu.tscn")
