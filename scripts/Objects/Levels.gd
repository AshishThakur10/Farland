extends Control


func _ready():
	pass


func _on_Main_Manu_pressed():
	get_tree().change_scene("res://scenes/UI/MainMenu.tscn")

func _on_level1_pressed():
	get_tree().change_scene("res://scenes/Levels/Level1.tscn")

func _on_level2_pressed():
	get_tree().change_scene("res://scenes/Levels/Level2.tscn") #

func _on_level3_pressed():
	get_tree().change_scene("res://scenes/Levels/Level3.tscn") #

func _on_level4_pressed():
	get_tree().change_scene("res://scenes/Levels/Level4.tscn") #

func _on_level5_pressed():
	get_tree().change_scene("res://scenes/Levels/Level5.tscn") #

func _on_level6_pressed():
	get_tree().change_scene("res://scenes/Levels/Level6.tscn") #
