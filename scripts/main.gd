extends Node

onready var options_scene: PackedScene = preload('res://scenes/Options.tscn')
export var next_scene: PackedScene
export var mouse_pet: AnimatedTexture
export var mouse_idle: AnimatedTexture

func _ready():
	pass # Replace with function body.


func _on_Options_pressed():
	var options = options_scene.instance()
	add_child(options)


func _on_Start_pressed():
	if next_scene:
		get_tree().change_scene_to(next_scene)


func _on_Quit_pressed():
	get_tree().quit()


func _on_TextureRect_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		$MarginContainer/HBoxContainer/CenterContainer/TextureRect.texture = mouse_pet


func _on_TextureRect_mouse_exited():
	$MarginContainer/HBoxContainer/CenterContainer/TextureRect.texture = mouse_idle
