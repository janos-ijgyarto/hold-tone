class_name NPCController
extends Node

var control_value : Vector2 = Vector2.ZERO

# FIXME: this is super hacky, need better decoupling!
var _behavior_tree : BehaviorTree

func _ready():
	var components : ComponentList = get_parent()
	_behavior_tree = components.get_component(BehaviorTree)

func _process(_delta):
	var ai_control_value = _behavior_tree.blackboard.get_data("control")
	if ai_control_value != null:
		control_value = ai_control_value
