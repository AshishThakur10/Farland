extends Control


func _ready():
	pass


func _on_Main_Manu_pressed():
	get_tree().change_scene("res://scenes/UI/MainMenu.tscn")

func _on_level1_pressed():
	get_tree().change_scene("res://scenes/Levels/Level1.tscn")
