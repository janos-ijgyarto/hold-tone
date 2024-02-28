class_name Composite
extends Behavior

var _children : Array[Behavior]

# Called when the node enters the scene tree for the first time.
func _ready():
	for current_child in get_children():
		if current_child is Behavior:
			_children.append(current_child)
