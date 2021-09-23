class_name GrowOnHover
extends Node

var parent: Node
var tween: Tween

func _ready():
	parent = get_node('../')
	parent.connect('mouse_entered', self, '_on_Button_mouse_entered')
	parent.connect('mouse_exited', self, '_on_Button_mouse_exited')
	tween = Tween.new()
	add_child(tween)

func _on_Button_mouse_entered() -> void:
	parent.rect_pivot_offset = parent.rect_size/2
	#tween.interpolate_property(parent, 'rect_position', parent.rect_position, Vector2(20,parent.rect_position.y), 0.2)
	tween.interpolate_property(parent, 'rect_scale', parent.rect_scale, Vector2(1.2,1.2), 0.2)
	tween.start()


func _on_Button_mouse_exited() -> void:
#	tween.interpolate_property(parent, 'rect_position', parent.rect_position, Vector2(0,parent.rect_position.y), 0.2)
	tween.interpolate_property(parent, 'rect_scale', parent.rect_scale, Vector2(1.0,1.0), 0.2)
	tween.start()
