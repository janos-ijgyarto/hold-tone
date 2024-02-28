class_name Behavior
extends Node

enum BehaviorStatus
{
	INVALID,
	SUCCESS,
	FAILURE,
	RUNNING,
	ABORTED
}

var _status : BehaviorStatus = BehaviorStatus.INVALID

var status : BehaviorStatus:
	get: return _status
	set(value): pass

var terminated : bool :
	get: return (status == BehaviorStatus.SUCCESS || status == BehaviorStatus.FAILURE)
	set(value): pass
	
var running : bool :
	get: return status == BehaviorStatus.RUNNING
	set(value): pass
	
func update(_tree : BehaviorTree) -> BehaviorStatus:
	push_error("UNIMPLEMENTED ERROR: Behavior.update()")
	return BehaviorStatus.FAILURE

func on_initialize(_tree : BehaviorTree) -> void:
	pass
	
func on_terminate(_tree : BehaviorTree, _terminate_status : BehaviorStatus) -> void:
	pass

func tick(tree : BehaviorTree) -> BehaviorStatus:
	if _status != BehaviorStatus.RUNNING:
		on_initialize(tree)

	_status = update(tree);

	if _status != BehaviorStatus.RUNNING:
		on_terminate(tree, _status)

	return _status

func reset() -> void:
	_status = BehaviorStatus.INVALID

func abort(tree : BehaviorTree) -> void:
	on_terminate(tree, BehaviorStatus.ABORTED)
	_status = BehaviorStatus.ABORTED
