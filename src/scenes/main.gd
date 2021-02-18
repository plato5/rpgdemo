extends Node

onready var start_menu_scene = preload("res://scenes/start_menu.tscn")
var start_menu 

const _log = preload("res://src/utils/log.gd")


func _ready():
	initialize()
		
		
		
func initialize():
	start_menu = start_menu_scene.instance()
	
	# todo: need to add some logging
	if (start_menu != null):
		_set_up_start_menu()
	else:
		printerr("System failed to initialize")
		get_tree().quit()
			


func _set_up_start_menu():
	add_child(start_menu)	
	if (start_menu.connect("_start_game", self, "_on_start_game_pressed") != OK):
		printerr("Event are not connected")
	if (start_menu.connect("_load_game", self, "_on_load_game_pressed") != OK):
		printerr("Event are not connected")
	if (start_menu.connect("_exit_game", self, "_on_exit_game_pressed") != OK):
		printerr("Event are not connected")
	
	

func _on_start_game_pressed():	
	var root = get_tree().get_root()
	root.remove_child(start_menu)
	start_menu.queue_free()
	# todo: load new game
	
	

func _on_load_game_pressed():
	var root = get_tree().get_root()
	root.remove_child(start_menu)
	start_menu.queue_free()
	#todo: load saved game
	
	
	
func _on_exit_game_pressed():
	get_tree().quit()
	
	
	
