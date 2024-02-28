class_name Condition
extends Behavior

func update(tree : BehaviorTree) -> BehaviorStatus:
	if _evaluate_condition(tree) == true:
		return BehaviorStatus.SUCCESS
	else:
		return BehaviorStatus.FAILURE
	
func _evaluate_condition(_tree : BehaviorTree) -> bool:
	push_error("UNIMPLEMENTED ERROR: Condition._evaluate_condition()")
	return false
