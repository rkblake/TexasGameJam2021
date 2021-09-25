extends RigidBody2D

func _ready():
	pass


func _physics_process(delta):
	if abs(angular_velocity) > 0.3:
		$AnimatedSprite.animation = 'Roll'
	else:
		$AnimatedSprite.animation = 'Idle'
		$AnimatedSprite.rotation_degrees = rotation_degrees * -1
		
	$AnimatedSprite.flip_h = linear_velocity.x < 0
