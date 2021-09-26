extends Control

export var next_scene: PackedScene

func _ready():
	pass


func _on_Next_pressed():
	get_tree().change_scene_to(next_scene)
