extends Node2D

onready var options_scene: PackedScene = preload('res://scenes/Options.tscn')

const GRAVITY = 800
var is_in_button := false
var _button

func _ready():
	pass


func _physics_process(delta):
	if is_in_button and Input.is_action_pressed('ui_select'):
		$Mouse.sleeping = true
#		var distance := Vector2(_button.position - $Mouse.position)
#		var force := GRAVITY / distance.length_squared()
#		$Mouse.add_central_force(distance.normalized() * force)
#		if $Mouse.linear_velocity.normalized().dot(distance.normalized()) < 0:
#			$Mouse.add_central_force(distance.normalized() * force * 0.5)


func _input(event) -> void:
	if Input.is_action_just_pressed('ui_cancel'):
		#TODO pause all physics objects, put them all in a group
		var options = options_scene.instance()
		$GUI.add_child(options)


func _on_Button_button_entered(button):
	is_in_button = true
	_button = button
