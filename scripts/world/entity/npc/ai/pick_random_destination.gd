class_name PickRandomDestination
extends Behavior

@export var _radius : float = 200.0
@export var _position_key : String = "position"
@export var _destination_key : String = "destination" # FIXME: have a proper input/output system?

func update(tree : BehaviorTree) -> BehaviorStatus:
	# Pick a random destination
	# FIXME: provide parameters for more complex destination choice, for now we'll just have it orbit the center

	# Start on the opposite side of current position
	var new_destination : Vector2 = tree.blackboard.get_data(_position_key)
	new_destination = -(new_destination.normalized())

	# Rotate by random amount, choose random scale w.r.t radius
	new_destination = new_destination.rotated(randf_range(-PI * 0.4, PI * 0.4)) * randf_range(_radius * 0.25, _radius);

	tree.blackboard.set_data(_destination_key, new_destination);

	return BehaviorStatus.SUCCESS
