extends Node2D

signal touch_coin


func _ready():
	pass



func _on_StaticBody2D_body_entered(body):
	emit_signal('touch_coin')
	#TODO play tween
	queue_free()
