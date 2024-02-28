class_name RepeatUntil
extends Decorator

@export var _end_status : BehaviorStatus = BehaviorStatus.FAILURE

func update(tree : BehaviorTree) -> BehaviorStatus:
	_child.tick(tree)
	if _child.status == _end_status:
		# Reached desired end status
		return _end_status
	else:
		# Child still running (or needs to run again)
		if _child.status != BehaviorStatus.RUNNING:
			_child.reset()
		return BehaviorStatus.RUNNING
	
	return BehaviorStatus.INVALID
