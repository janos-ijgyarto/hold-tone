class_name BehaviorTree
extends Node

@export var _root_prefab : PackedScene

var _blackboard : Blackboard = null
#@onready var _tree : Node = $Tree

var _root_behavior : Behavior

var blackboard : Blackboard :
	get: return _blackboard
	set(value): pass

# Called when the node enters the scene tree for the first time.
func _ready():
	_root_behavior = _root_prefab.instantiate()
	add_child(_root_behavior)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# TODO: time slicing, etc.!
	_root_behavior.tick(self)
