class_name Level
extends Node2D

@export var _player_prefab : PackedScene
@export var _enemy_prefab : PackedScene

@onready var _entities : Node2D = $Entities
@onready var _camera : Camera2D = $Camera2D

var _player : Player
var _npc_blackboards : Array[Blackboard]

# Called when the node enters the scene tree for the first time.
func _ready():
	_player = _player_prefab.instantiate();
	_player._speed = 100.0
	_player._acceleration = 100.0
	_player.position = Vector2.ZERO
	_entities.add_child(_player)
	
	var npcs_node : Node2D = _entities.get_node("NPCs")

	var spawned_enemy : NPC = _enemy_prefab.instantiate()
	spawned_enemy.position = Vector2(randf_range(-200, 200), randf_range(-200, 200))
	spawned_enemy._speed = randf_range(25.0, 50.0)
	npcs_node.add_child(spawned_enemy)
	
	# Add a blackboard to each NPC
	for current_npc in npcs_node.get_children():
		if current_npc is NPC:
			var npc_btree : BehaviorTree = current_npc.components.get_component(BehaviorTree)
			var npc_blackboard = Blackboard.new()
			npc_btree._blackboard = npc_blackboard
			_npc_blackboards.append(npc_blackboard)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	_camera.position = _player.position
	var npcs_node : Node2D = _entities.get_node("NPCs")
	for current_npc_index in _npc_blackboards.size():
		var current_blackboard = _npc_blackboards[current_npc_index]
		current_blackboard.set_data("player", _player.global_position)
		var current_npc_position = npcs_node.get_child(current_npc_index).global_position
		current_blackboard.set_data("position", current_npc_position)
