extends TextureRect

onready var _map_image: ImageTexture
onready var _window_size: Vector2
onready var exit_game_func_property: FuncRef


# scenes
onready var _start_menu_scene = preload("res://scenes/start_menu.tscn")
var _start_menu 


onready var _console_scene = preload("res://scenes/console.tscn")
var _console


# static classes
const _log = preload("res://src/utils/log.gd")
const _image_handler = preload("res://src/utils/image_handler.gd")
const _math = preload("res://src/utils/math.gd")


func _ready():
	initialize()
		
				
func initialize():
	_set_size_from_window()
	
	_map_image = _image_handler.set_image_texture_to_scale(_window_size, "res://assets/images/backgrounds/gamemap.jpg")					
	texture = _map_image
	
	_start_menu = _start_menu_scene.instance()	
	if (_start_menu != null):
		_set_up_start_menu()
	else:
		_handle_errors("System failed to load start menu")
		get_tree().quit()
			

func _set_up_start_menu():	
	add_child(_start_menu)		
	_start_menu.start_exit_func_property = funcref(self, "handle_exit")
	_start_menu.start_load_func_property = funcref(self, "handle_load")
	_start_menu.start_game_func_property = funcref(self, "handle_start")

		
func handle_start():		
	_close_scene(_start_menu)
	
#	_console = _console_scene.instance()
#	_console.console_quit_game_func_property = funcref(self, "handle_exit")		
#	add_child(_console)	
	
		
func handle_load():
	_close_scene(_start_menu)
	
		
func handle_exit():
	if (_start_menu != null):
		_close_scene(_start_menu)
	elif (_console != null):
		_close_scene(_console)
	
	exit_game_func_property.call_func()
	
	
	
func _close_scene(scene: Node) -> void:	
	scene.queue_free()
	

func _handle_errors(message: String) -> void:
	_log.print_to_log(message)
	

func _set_size_from_window() -> void:
	_window_size = get_viewport().size	
	
