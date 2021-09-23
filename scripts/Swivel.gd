class_name SwivelEffect
extends Node

var parent: Node

func _ready():
	parent = get_node('../')

func _process(delta):
	if parent.has_method('set_rotation'):
		parent.set_rotation(sin((OS.get_ticks_msec()+randf())/100)/50)
