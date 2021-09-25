extends Node2D

onready var options_scene: PackedScene = preload('res://scenes/Options.tscn')

func _ready():
	pass


func _input(event) -> void:
	if Input.is_action_just_pressed('ui_cancel'):
		#TODO pause all physics objects
		var options = options_scene.instance()
		$GUI.add_child(options)
