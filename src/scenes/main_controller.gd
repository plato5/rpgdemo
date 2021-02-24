extends Node

onready var _main_view: TextureRect
onready var _window_size: Vector2
onready var quit_game_func_property: FuncRef


# static classes
const _log = preload("res://src/utils/log.gd")


func _ready():
	_log.print_to_log("starting up main view...")
	_initialize()
	
		
func _initialize() -> void:	
	_main_view = get_node("main_view")
	_main_view.main_quit_game_func_property = funcref(self, "handle_quit")


func handle_quit() -> void:
	if (quit_game_func_property != null):
		quit_game_func_property.call_func()
	else:
		_handle_errors("main funref is null")
	
			
	

func _handle_errors(message: String) -> void:
	_log.print_to_log(message)
	

	
	
		
