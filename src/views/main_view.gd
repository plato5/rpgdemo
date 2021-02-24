extends TextureRect

onready var _map_image: ImageTexture
onready var _window_size: Vector2
onready var main_quit_game_func_property: FuncRef

onready var _console_scene = preload("res://scenes/console.tscn")
var _console


# static classes
const _image_handler = preload("res://src/utils/image_handler.gd")
const _log = preload("res://src/utils/log.gd")

func _ready():
	_initialize()


func _initialize() -> void:
	_set_size_from_window()
	_map_image = _image_handler.set_image_texture_to_scale(_window_size, "res://assets/images/backgrounds/gamemap.jpg")					
	texture = _map_image	
	
	_console = _console_scene.instance()
	_console.console_quit_game_func_property = funcref(self, "handle_quit")		
	add_child(_console)	

		
func handle_quit() -> void:
	if (main_quit_game_func_property != null):
		main_quit_game_func_property.call_func()
	else:
		_handle_errors("console funref is null")
	
					
func _set_size_from_window() -> void:
	_window_size = get_viewport().size	
	

func _handle_errors(message: String) -> void:
	_log.print_to_log(message)
	

