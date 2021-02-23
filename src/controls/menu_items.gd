extends VBoxContainer

onready var _window_size: Vector2

# static classes
const _math = preload("res://src/utils/math.gd")
const _log = preload("res://src/utils/log.gd")


func _ready():	
	_initialize()
	

func _initialize() -> void:  
    _set_size_from_window()	    
    rect_size = _math.scale_node_dimension(_window_size, 0.30)		
    rect_position = _math.position_node_to_parent(_window_size, 0.30, 0.70)


func _set_size_from_window() -> void:
    _window_size = get_viewport().size	
    