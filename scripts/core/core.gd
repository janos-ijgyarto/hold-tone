extends Node

@onready var _world : World = get_node("World")
@onready var _gui : GUI = get_node("GUI")

var world : World :
	get: return _world
	set(value): pass
	
var gui : GUI :
	get: return _gui
	set(value): pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
