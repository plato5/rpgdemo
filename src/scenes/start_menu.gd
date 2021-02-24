extends Node

onready var _start_btn: Button
onready var _load_btn: Button
onready var _exit_btn: Button
onready var _window_size: Vector2

onready var start_exit_func_property: FuncRef
onready var start_load_func_property: FuncRef
onready var start_game_func_property: FuncRef

# static classes
const _image_handler = preload("res://src/utils/image_handler.gd")
const _math = preload("res://src/utils/math.gd")
const _log = preload("res://src/utils/log.gd")


func _ready():	
	_initialize()
	

func _initialize() -> void:
	_log.print_to_log("initializing start_menu: ")
	_set_size_from_window()	
	_set_btn_handlers()
	
		
func _set_size_from_window() -> void:
	_window_size = get_viewport().size	
	
						
func _set_btn_handlers() -> void:	
	_start_btn = get_node("start_menu_view/start_menu_items/start_menu_start_btn")
	_load_btn = get_node("start_menu_view/start_menu_items/start_menu_load_btn")
	_exit_btn = get_node("start_menu_view/start_menu_items/start_menu_exit_btn")
		
	_exit_btn.exit_btn_func_property = funcref(self, "handle_exit")	
	_load_btn.load_btn_func_property = funcref(self, "handle_load")
	_start_btn.start_btn_func_property = funcref(self, "handle_start")
	
		
func handle_exit() -> void:
	if (start_exit_func_property != null):
		start_exit_func_property.call_func()
	else:	
		_handle_errors("start_menu function ref is null: ")


func handle_load() -> void:
	if (start_load_func_property != null):
		start_load_func_property.call_func()
	else:
		_handle_errors("start_menu function ref is null: ")


func handle_start() -> void:
	if (start_game_func_property != null):
		start_game_func_property.call_func()
	else:
		_handle_errors("start_menu function ref is null: ")


func _handle_errors(message: String) -> void:
	_log.print_to_log(message)

	
	
	
	
	
	
	
	
