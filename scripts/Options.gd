extends Control

signal close_options

func _ready():
	$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/FullscreenToggle.pressed = OS.window_fullscreen


func _on_SoundToggle_toggled(button_pressed):
	pass


func _on_FullscreenToggle_toggled(button_pressed):
	OS.window_fullscreen = button_pressed


func _on_Button_pressed():
	emit_signal('close_options')
	queue_free()


func _on_Exit_pressed():
	get_tree().quit()
