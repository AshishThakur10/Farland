extends Control


func _ready():
	pass



func _on_musiceVolume_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index('Musice'),value)
	pass # Replace with function body.


func _on_soundVolume_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index('SFX'),value)
