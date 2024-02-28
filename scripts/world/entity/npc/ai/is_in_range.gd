class_name IsInRange
extends Condition

@export var _range : float = 5.0
@export var _position_key : String = "position"
@export var _target_key : String = "target"

func _evaluate_condition(tree : BehaviorTree) -> bool:
	var position : Vector2 = tree.blackboard.get_data(_position_key)
	var target : Vector2 = tree.blackboard.get_data(_target_key)
	
	if position.distance_squared_to(target) <= (_range * _range):
		return true
	
	return false
