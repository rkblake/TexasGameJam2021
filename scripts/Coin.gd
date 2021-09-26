extends Node2D

signal touch_coin


func _ready():
	pass



func _on_StaticBody2D_body_entered(body):
	emit_signal('touch_coin')
	$AudioStreamPlayer.play()
	$AnimatedSprite.animation = 'get'
	$StaticBody2D/CollisionShape2D.set_deferred('disabled', true)
	$Timer.start()
	yield($Timer, 'timeout')
	$AnimatedSprite.animation = 'idle'
	$StaticBody2D/CollisionShape2D.set_deferred('disabled', false)
