extends HBoxContainer

onready var _window_size: Vector2
onready var _current_size: Vector2

# static classes
const _math = preload("res://src/utils/math.gd")

func _ready():
	_initialize()


func _initialize() -> void:
	_window_size = get_viewport().size	
	_current_size = _math.scale_node_dimension(_window_size, 0.65)	
	rect_size = _math.scale_node_dimension(_current_size, 0.03)
	rect_position = _math.position_node_to_parent(_current_size, 1.50, 1.60)	
		
