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
	
	# todo: need to add some logging
	if (_start_menu != null):
		_set_up_start_menu()
	else:
		_handle_errors("System failed to load start menu")
		get_tree().quit()
			

func _set_up_start_menu():
	add_child(_start_menu)	
	if (_start_menu.connect("_start_game", self, "_on_start_game_pressed") != OK):
		_handle_errors("Event are not connected")
	if (_start_menu.connect("_load_game", self, "_on_load_game_pressed") != OK):
		_handle_errors("Event are not connected")
	if (_start_menu.connect("_exit_game", self, "_on_exit_game_pressed") != OK):
		_handle_errors("Event are not connected")
	
	
func _on_start_game_pressed():	
	_close_scene(_start_menu)
	# todo: start new game
	_main_controller = _main_controller_scene.instance()
	add_child(_main_controller)
	
	
func _on_load_game_pressed():
	_close_scene(_start_menu)
	# todo: load existing game
	
		
func _on_exit_game_pressed():
	_close_scene(_start_menu)
	get_tree().quit()
	
	
func _close_scene(scene: Node) -> void:	
	scene.queue_free()
	

# todo: may want to do more here
func _handle_errors(message: String) -> void:
	_log.print_to_log(message)
	
	
	
	
