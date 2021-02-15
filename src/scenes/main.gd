extends Node

onready var start_menu_scene = preload("res://scenes/start_menu.tscn")
var start_menu 


func _ready():
	initialize()
		
		
		
func initialize():
	start_menu = start_menu_scene.instance()
	if (start_menu != null):
		_set_up_start_menu()
	else:
		printerr("System failed to initialize")
			


func _set_up_start_menu():
	add_child(start_menu)	
	start_menu.connect("_start_game", self, "_on_start_game_pressed")
	start_menu.connect("_load_game", self, "_on_load_game_pressed")
	start_menu.connect("_exit_game", self, "_on_exit_game_pressed")
	
	

func _on_start_game_pressed():
	print("Starting Game..")
	
	

func _on_load_game_pressed():
	print("Loading Game...")
	
	
	
func _on_exit_game_pressed():
	print("Exiting Game...")
	
	
	
