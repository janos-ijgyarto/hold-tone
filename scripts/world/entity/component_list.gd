class_name ComponentList
extends Node

func get_component(type: Variant) -> Node:
	for current_child in get_children():
		if is_instance_of(current_child, type):
			return current_child
	
	return null
