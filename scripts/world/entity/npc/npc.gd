class_name NPC
extends Node2D

@export var _speed : float = 10.0

@onready var _components : ComponentList = get_node("Components")

var components : ComponentList :
	get: return _components
	set(value): pass

var _controller : NPCController

# Called when the node enters the scene tree for the first time.
func _ready():
	_controller = _components.get_component(NPCController)

func _physics_process(delta) -> void:
	var velocity = _controller.control_value * _speed;

	position += velocity * delta
