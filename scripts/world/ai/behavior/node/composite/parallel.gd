class_name Parallel
extends Composite

enum Policy { REQUIRE_ONE, REQUIRE_ALL }

@export var _success_policy : Policy = Policy.REQUIRE_ALL
@export var _failure_policy : Policy = Policy.REQUIRE_ONE

func on_initialize(_tree : BehaviorTree) -> void:
	for current_child in _children:
		current_child.reset()
		
func update(tree : BehaviorTree) -> BehaviorStatus:
	var success_count : int = 0
	var failure_count : int = 0
	
	for current_child in _children:
		if current_child.terminated == false:
			current_child.tick(tree)
		
		if current_child.status == BehaviorStatus.SUCCESS:
			success_count += 1
			if _success_policy == Policy.REQUIRE_ONE:
				return BehaviorStatus.SUCCESS
		
		if current_child.status == BehaviorStatus.FAILURE:
			failure_count += 1
			if _failure_policy == Policy.REQUIRE_ONE:
				return BehaviorStatus.FAILURE
	
	if (_failure_policy == Policy.REQUIRE_ALL) and (failure_count == _children.size()):
		return BehaviorStatus.FAILURE

	if (_success_policy == Policy.REQUIRE_ALL) && (success_count == _children.size()):
		return BehaviorStatus.SUCCESS

	return BehaviorStatus.RUNNING
	
func on_terminate(tree : BehaviorTree, _terminate_status : BehaviorStatus) -> void:
	for current_child in _children:
		if current_child.running == true:
			current_child.abort(tree)
