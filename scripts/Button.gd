extends Node2D

signal button_entered(button)
signal button_exited(button)
signal button_pressed(button)
signal button_released(button)

func _ready():
	pass


func _on_Center_body_entered(body):
	emit_signal('button_pressed', self)


func _on_Center_body_exited(body):
	emit_signal('button_released', self)


func _on_Gravity_body_entered(body):
	emit_signal('button_entered', self)


func _on_Gravity_body_exited(body):
	emit_signal('button_exited', self)
