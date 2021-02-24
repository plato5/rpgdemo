extends TextureRect

onready var _console_image: ImageTexture
onready var _window_size: Vector2


# static classes
const _image_handler = preload("res://src/utils/image_handler.gd")
const _math = preload("res://src/utils/math.gd")
const _log = preload("res://src/utils/log.gd")

var _current_size: Vector2


func _ready():
	_initialize()


func _initialize() -> void:
	_set_size_from_window()
	_set_console_view()		

	
func _set_console_view() -> void:
	_current_size = _math.scale_node_dimension(_window_size, 0.65)	
	rect_size = _current_size			
	rect_position = _math.position_node_to_parent(_window_size, 0.30, 0.30)	
	
	_console_image = _image_handler.set_image_texture_to_scale(_current_size, "res://assets/images/backgrounds/console/console1.jpg")						
	texture = _console_image
			
			
func _set_size_from_window() -> void:
	_window_size = get_viewport().size	
	
	
func _handle_errors(message: String) -> void:
	_log.print_to_log(message)
	
