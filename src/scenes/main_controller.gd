extends Node

onready var _main_view: TextureRect
onready var _window_size: Vector2

signal _exit_game()

# static classes
const _log = preload("res://src/utils/log.gd")


func _ready():
	_log.print_to_log("starting up main view...")
	_initialize()
	
		
func _initialize() -> void:	
	pass
	_set_size_from_window()
	_set_main_view()	
	
	
func _set_size_from_window() -> void:
	_window_size = get_viewport().size	
	
	
func _set_main_view() -> void:
	_main_view = get_node("main_view")	
	
	if (_main_view.connect("_exit_game", self, "_quit_game_pressed") != OK):
		_handle_errors("Event are not connected")
		
		

func _quit_game_pressed() -> void:
	_handle_errors("main_view: clicked")
	emit_signal("_exit_game")
	
	

func _handle_errors(message: String) -> void:
	_log.print_to_log(message)
	

	
	
		
