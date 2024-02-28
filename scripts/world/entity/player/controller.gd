class_name PlayerController
extends Node

var _control_value : Vector2

var control_value : Vector2 : 
	get: return _control_value
	set(value): pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	_control_value = Input.get_vector("move_left", "move_right", "move_up", "move_down")
