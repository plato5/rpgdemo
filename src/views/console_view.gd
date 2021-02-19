class_name ConsoleView extends TextureRect

onready var _console_image: ImageTexture
onready var _window_size: Vector2
onready var _console_content: VBoxContainer
onready var _console_actions: HBoxContainer

# static classes
const _image_handler = preload("res://src/utils/image_handler.gd")
const _math = preload("res://src/utils/math.gd")
const _log = preload("res://src/utils/log.gd")

var _current_size: Vector2


func _ready():
	_initialize()


func _initialize() -> void:
	_set_size_from_window()
	_current_size = _math.scale_node_dimension(_window_size, 0.65)
	rect_size = _current_size			
	rect_position = _math.position_node_to_parent(_window_size, 0.30, 0.30)	
	
	_console_image = _image_handler.set_image_texture_to_scale(_current_size, "res://assets/images/backgrounds/console/console1.jpg")						
	texture = _console_image
	
	_set_console_content()
	_set_console_actions()

		
func _set_console_content() -> void:
	_console_content = get_node("console_content")
	_console_content.rect_size = _math.scale_node_dimension(_current_size, 0.65)
	_console_content.rect_position = _math.position_node_to_parent(_current_size, 0.30, 0.30)	
	
		
func _set_console_actions() -> void:
	_console_actions = get_node("console_actions")
	_console_actions.rect_size = _math.scale_node_dimension(_current_size, 0.20)
	_console_actions.rect_position = _math.position_node_to_parent(_current_size, 0.30, 0.30)	
	
	
func _set_size_from_window() -> void:
	_window_size = get_viewport().size	
