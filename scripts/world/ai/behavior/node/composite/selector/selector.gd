class_name Selector
extends Composite

var _selected_index : int

var selected_child : Behavior :
	get: return _children[_selected_index]
	set(value): pass

func on_initialize(_tree : BehaviorTree) -> void:
	_init_selector()
	
func on_terminate(tree : BehaviorTree, _terminate_status : BehaviorStatus) -> void:
	return _update_selector(tree)
	
func _init_selector() -> void:
	_selected_index = 0

func _update_selector(tree : BehaviorTree) -> BehaviorStatus:
	# Keep going until a child behavior says its running.
	for current_child_index in _children.size():
		_selected_index = current_child_index
		var current_status : BehaviorStatus = selected_child.tick(tree)

		# If the child succeeds, or keeps running, do the same.
		if current_status != BehaviorStatus.FAILURE:
			return current_status

	# Hit the end of the array, it didn't end well...
	return BehaviorStatus.FAILURE;
