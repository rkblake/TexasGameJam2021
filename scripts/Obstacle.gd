extends StaticBody2D

func _ready():
	pass


func disable(disabled):
#	$CollisionShape2D.disabled = disabled
	$CollisionShape2D.set_deferred('disabled', disabled)
#	set_collision_layer_bit(0, disabled)
	$AnimatedSprite.animation = 'clear' if disabled else 'idle'
