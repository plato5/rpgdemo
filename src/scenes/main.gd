extends Node

# scenes
onready var _start_menu_scene = preload("res://scenes/start_menu.tscn")
var _start_menu 

onready var _main_controller_scene = preload("res://scenes/main_controller.tscn")
var _main_controller

# static classes
const _log = preload("res://src/utils/log.gd")


func _ready():
	initialize()
		
				
func initialize():
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
	_main_controller = _main_controller_scene.instance()
	_main_controller.quit_game_func_property = funcref(self, "handle_exit")
	add_child(_main_controller)
	
		
func handle_load():
	_close_scene(_start_menu)
	# todo: load existing game
	
		
func handle_exit():
	if (_start_menu != null):
		_close_scene(_start_menu)
	if (_main_controller != null):
		_close_scene(_main_controller)
	get_tree().quit()
	
	
func _close_scene(scene: Node) -> void:	
	scene.queue_free()
	

func _handle_errors(message: String) -> void:
	_log.print_to_log(message)
	
	
	
	
