class_name Player
extends CharacterBody2D

@export var _speed : float = 1.0
@export var _acceleration : float = 1.0

@onready var _components : ComponentList = get_node("Components")

var _controller : PlayerController

# Called when the node enters the scene tree for the first time.
func _ready():
	_controller = _components.get_component(PlayerController)

func _physics_process(delta) -> void:
	var prev_velocity = get_velocity();
	var new_velocity = _controller.control_value * _speed;

	set_velocity(prev_velocity.lerp(new_velocity, delta * _acceleration))
	move_and_slide()
