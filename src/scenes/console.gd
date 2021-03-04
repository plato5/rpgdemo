extends Node

onready var _console_view: TextureRect
onready var _window_size: Vector2
onready var _console_move_btn: Button
onready var _console_quit_btn: Button
onready var console_quit_game_func_property: FuncRef

# static classes
const _log = preload("res://src/utils/log.gd")


func _ready():
	_log.print_to_log("starting up console view...")
	_initialize()
	
		
func _initialize() -> void:	
	pass
	_set_size_from_window()	
	#_set_btn_handlers()
		
	
func _set_size_from_window() -> void:
	_window_size = get_viewport().size	
	
#
#func _set_btn_handlers() -> void:
#	_console_move_btn = get_node("console_view/console_actions/console_move_btn")
#	_console_quit_btn = get_node("console_view/console_actions/console_quit_btn")
#
#	_console_quit_btn.console_quit_func_property = funcref(self, "handle_quit")
#
#
#func handle_quit() -> void:
#	if (console_quit_game_func_property != null):
#		console_quit_game_func_property.call_func()
#	else:
#		_handle_errors("console funref is null")
#
#

func _handle_errors(message: String) -> void:
	_log.print_to_log(message)
	
	
	
	
