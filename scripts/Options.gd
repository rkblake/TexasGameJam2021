extends Control

func _ready():
	pass


func _on_SoundToggle_toggled(button_pressed):
	pass # Replace with function body.


func _on_FullscreenToggle_toggled(button_pressed):
	OS.window_fullscreen = button_pressed


func _on_Button_pressed():
	queue_free()
