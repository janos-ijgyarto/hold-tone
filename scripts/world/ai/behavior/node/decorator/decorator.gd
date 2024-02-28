class_name Decorator
extends Behavior

var _child : Behavior

# Called when the node enters the scene tree for the first time.
func _ready():
	if get_children().size() > 1:
		push_error("BEHAVIOR TREE ERROR: invalid tree configuration for Decorator!")
		
	var child = get_child(0)
	if child is Behavior:
		_child = child
	else: 
		push_error("BEHAVIOR TREE ERROR: Decorator child must be Behavior!")
