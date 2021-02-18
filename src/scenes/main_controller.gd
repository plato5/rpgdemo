extends Node

onready var _main_view: TextureRect
onready var _window_size: Vector2

# static 
const _log = preload("res://src/utils/log.gd")


func _ready():
	_log.print_to_log("starting up main view...")
	_initialize()
	
		
func _initialize() -> void:	
	_set_size_from_window()
	_set_main_view()
	
	
func _set_size_from_window() -> void:
	_window_size = get_viewport().size	
	
	
func _set_main_view() -> void:
	_main_view = get_node("main_view")	
	
	
	
	
		
