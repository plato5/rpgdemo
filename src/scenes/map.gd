extends Node

onready var _map_view: TextureRect
onready var _map_image: ImageTexture
onready var _window_size: Vector2

const _image_handler = preload("res://src/utils/image_handler.gd")
const _math = preload("res://src/utils/math.gd")
const _log = preload("res://src/utils/log.gd")


func _ready():
	_log.print_to_log("starting up map view...")
	_initialize()
	
	
func _initialize() -> void:	
	_set_size_from_window()
	_set_map_view()
	
	

func _set_size_from_window() -> void:
	_window_size = get_viewport().size	
	
	

func _set_map_view() -> void:
	_map_view = get_node("map_view")
	_map_view.rect_size = _window_size	
	_map_view.texture = _image_handler.set_image_texture_to_scale(_window_size, "res://assets/images/backgrounds/gamemap.jpg")				
	
