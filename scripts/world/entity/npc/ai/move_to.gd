class_name MoveTo
extends Behavior

@export var _position_key : String = "position"
@export var _destination_key : String = "move_to"
@export var _control_key : String = "control"

func update(tree : BehaviorTree) -> BehaviorStatus:
	var position : Vector2 = tree.blackboard.get_data(_position_key)
	var destination : Vector2 = tree.blackboard.get_data(_destination_key)
	
	if position.distance_squared_to(destination) < 0.1:
		# FIXME: should we do everything through the blackboard, or allow low-level actions to just modify game state directly?
		tree.blackboard.set_data(_control_key, Vector2.ZERO)
		return BehaviorStatus.SUCCESS
	
	# FIXME: should we do everything through the blackboard, or allow low-level actions to just modify game state directly?
	tree.blackboard.set_data(_control_key, position.direction_to(destination))
	return BehaviorStatus.RUNNING
