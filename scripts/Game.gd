extends Node2D

onready var options_scene: PackedScene = preload('res://scenes/Options.tscn')
onready var marble_scene: PackedScene = preload('res://scenes/Marble.tscn')
onready var marble = $Marble

#const GRAVITY = 800
var is_in_button := false
var _button
var coins := 0

func _ready():
	for button in get_tree().get_nodes_in_group('Button'):
		button.connect('button_entered', self, '_on_Button_button_entered')
		button.connect('button_exited', self, '_on_Button_button_exited')
		button.connect('button_pressed', self, '_on_Button_button_pressed')
		button.connect('button_released', self, '_on_Button_button_released')
	
	for coin in get_tree().get_nodes_in_group('Coin'):
		coin.connect('touch_coin', self, '_on_Coin_touch_coin')
	
	$MarbleDetector.connect('object_teleport', self, '_on_object_teleport')
	$Area2D.connect('object_teleport', self, '_on_object_teleport')
	$Area2D3.connect('object_teleport', self, '_on_object_teleport')


func _physics_process(delta):
	if is_in_button and (Input.is_action_pressed('push_button') or $GUI/Button.pressed):
		$Mouse.sleeping = true
#		$Mouse.position.linear_interpolate(_button.position, 0.5)
	if is_in_button and (Input.is_action_just_released('push_button') or $GUI/Button.pressed):
		$Mouse.sleeping = false
#		var distance := Vector2(_button.position - $Mouse.position)
#		var force := GRAVITY / distance.length_squared()
#		$Mouse.add_central_force(distance.normalized() * force)
#		if $Mouse.linear_velocity.normalized().dot(distance.normalized()) < 0:
#			$Mouse.add_central_force(distance.normalized() * force * 0.5)


func _input(event) -> void:
	if Input.is_action_just_pressed('ui_cancel'):
#		for objects in get_tree().get_nodes_in_group('Physics'):
#			objects.sleeping = true
		get_tree().paused = true
		var options = options_scene.instance()
		$GUI.add_child(options)
		options.connect('close_options', self, '_on_Options_close_options')


func _on_Button_button_entered(button):
	is_in_button = true
	_button = button


func _on_Button_button_exited(button):
	is_in_button = false


func _on_Button_button_pressed(button):
	marble.add_central_force(Vector2(0, 200)) #need force to get ball rolling again


func _on_Button_button_released(button):
	pass


func _on_Coin_touch_coin():
	coins += 1
	$GUI/Panel/Label.text = "Coins: %s" % coins


func _on_Options_close_options():
#	for objects in get_tree().get_nodes_in_group('Physics'):
#		objects.sleeping = false
	get_tree().paused = false


func _on_object_teleport(obj):
	if obj is Marble:
		marble.queue_free()
		var new_marble = marble_scene.instance()
		new_marble.position = Vector2(600, -126)
		new_marble.name = 'Marble'
		add_child(new_marble)
		marble = new_marble
	elif obj is Mouse:
		$Mouse/Camera2D.offset_h *= -1
