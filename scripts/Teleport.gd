extends Area2D

export var new_pos: Vector2

signal object_teleport(obj_name)

func _ready():
	pass


func _on_Area2D_body_entered(body):
	body.set_deferred('position', new_pos)
	if body is Mouse:
		$AudioStreamPlayer.play()
	emit_signal('object_teleport', body)
