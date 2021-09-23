extends Node

onready var options_scene: PackedScene = preload('res://scenes/Options.tscn')
export var game_scene: PackedScene

func _ready():
	pass # Replace with function body.


func _on_Options_pressed():
	var options = options_scene.instance()
	add_child(options)


func _on_Start_pressed():
	if game_scene:
		get_tree().change_scene_to(game_scene)


func _on_Quit_pressed():
	get_tree().quit()
