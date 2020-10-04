extends Node
 
var direction = 1
#var PauseMenu = get_tree().find_node("PauseMenu")
##onready PauseMenu = get_tree().get_node("PauseMenu")
#func _input(event: InputEvent) -> void:
##	if event.is_action_pressed("toggle_fullscreen"):
##		OS.window_fullscreen = not OS.window_fullscreen
##		get_tree().set_input_as_handled()
#	# The GlobalControls node, in the Stage scene, is set to process even
#	# when the game is paused, so this code keeps running.
#	# To see that, select GlobalControls, and scroll down to the Pause category
#	# in the inspector.
#	if event.is_action_pressed("toggle_pause"):
#		var tree = get_tree()
#		tree.paused = not tree.paused
#		if tree.paused:
#			PauseMenu.open()
#		else:
#			PauseMenu.close()
#		get_tree().set_input_as_handled()
