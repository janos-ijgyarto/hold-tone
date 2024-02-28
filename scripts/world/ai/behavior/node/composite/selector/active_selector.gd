class_name ActiveSelector
extends Selector

func on_initialize(_tree : BehaviorTree) -> void:
	_selected_index = _children.size()

func update(tree : BehaviorTree) -> BehaviorStatus:
	var last_index : int = _selected_index
	
	_init_selector()
	var result : BehaviorStatus = _update_selector(tree)
	
	if (last_index < _children.size()) and (_selected_index != last_index):
		# Swapping to higher priority node, abort previous node
		_children[last_index].abort(tree);
	
	return result
