extends Area2D

export var new_pos: Vector2

func _ready():
	pass


func _on_Area2D_body_entered(body):
	body.set_deferred('position', new_pos)
