class_name Repeat
extends Decorator

var _limit : int
var _counter : int = 0

var limit : int :
	get: return _limit
	set(value): pass

func on_initialize(_tree : BehaviorTree) -> void:
	_counter = 0
	
func update(tree : BehaviorTree) -> BehaviorStatus:
	while true:
		_child.tick(tree)
		if _child.status == BehaviorStatus.RUNNING:
			break
		if _child.status == BehaviorStatus.FAILURE:
			return BehaviorStatus.FAILURE
		_counter += 1				
		if _counter == limit:
			return BehaviorStatus.SUCCESS
		_child.reset()
	
	return BehaviorStatus.INVALID
