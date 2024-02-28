class_name Blackboard
extends RefCounted

var _data : Dictionary = {}

func get_data(key : String) -> Variant:
	return _data.get(key)

func set_data(key : String, value : Variant) -> void:
	_data[key] = value
