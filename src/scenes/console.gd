extends Node

onready var _console_view: TextureRect
onready var _window_size: Vector2

signal _exit_game()

# static classes
const _log = preload("res://src/utils/log.gd")


func _ready():
	_log.print_to_log("starting up console view...")
	_initialize()
	
		
func _initialize() -> void:	
	pass
	_set_size_from_window()
	_set_console_view()	
		
	
func _set_size_from_window() -> void:
	_window_size = get_viewport().size	
	
	
func _set_console_view() -> void:
	_console_view = get_node("console_view")
	if (_console_view.connect("_exit_game", self, "_on_exit_game_pressed") != OK):
		_handle_errors("Event are not connected")
		
		
func _on_exit_game_pressed() -> void:
	_handle_errors("console: clicked")
	emit_signal("_exit_game")
		

func _handle_errors(message: String) -> void:
	_log.print_to_log(message)
	
	
	
	
