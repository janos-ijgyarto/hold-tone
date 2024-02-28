class_name Sequence
extends Composite

var _child_index : int

var current_child : Behavior :
	get: return _children[_child_index]
	set(value): pass

func on_initialize(_tree : BehaviorTree) -> void:
	_child_index = 0

func update(tree : BehaviorTree) -> BehaviorStatus:
	# Keep going until a child behavior says it's running.
	while _child_index < _children.size():
		var current_status : BehaviorStatus = current_child.tick(tree)
		# If the child fails, or keeps running, do the same.
		if current_status != BehaviorStatus.SUCCESS:
			return current_status
		_child_index += 1

	# Hit the end of the array, job done!
	return BehaviorStatus.SUCCESS

func on_terminate(tree : BehaviorTree, _terminate_status : BehaviorStatus) -> void:
	for child in _children:
		if child.running == true:
			child.abort(tree)
