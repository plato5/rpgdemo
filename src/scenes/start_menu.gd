extends Node

onready var _start_menu_view: TextureRect
onready var _start_image: ImageTexture
onready var _menu_items: VBoxContainer
onready var _start_btn: Button
onready var _load_btn: Button
onready var _exit_btn: Button
onready var _start_lbl: Label
onready var _window_size: Vector2

# static classes
const _image_handler = preload("res://src/utils/image_handler.gd")
const _math = preload("res://src/utils/math.gd")
const _log = preload("res://src/utils/log.gd")


signal _start_game()
signal _load_game()
signal _exit_game()


# todo: might want to pull down some of this set up to child scripts
func _ready():	
	_initialize()
	


func _initialize() -> void:
	_log.print_to_log("initializing start_menu: ")
	_set_size_from_window()
	_set_start_menu_view()	
	_set_menu_items()
	
	
	
func _start_pressed() -> void:
	emit_signal("_start_game")
	
	

func _load_pressed() -> void:
	emit_signal("_load_game")
	
	

func _exit_pressed() -> void:
	emit_signal("_exit_game")
	
	

func _set_size_from_window() -> void:
	_window_size = get_viewport().size	
	
		
		
func _set_start_menu_view() -> void:
	_start_menu_view = get_node("start_menu_view")
	_start_menu_view.rect_size = _window_size	
	_start_menu_view.texture = _image_handler.set_image_texture_to_scale(_window_size, "res://assets/images/backgrounds/start_menu.jpg")				
	
	
			
func _set_menu_items() -> void:
	_menu_items = get_node("start_menu_view/menu_items")	
	_menu_items.rect_size = _math.scale_node_dimension(_window_size, 0.30)			
	_menu_items.rect_position = _math.position_node_to_parent(_window_size, 0.30, 0.70)
	
	_start_lbl = get_node("start_menu_view/menu_items/start_lbl")
	_start_btn = get_node("start_menu_view/menu_items/start_btn")
	_load_btn = get_node("start_menu_view/menu_items/load_btn")
	_exit_btn = get_node("start_menu_view/menu_items/exit_btn")
	
	# todo: might want to put the label in a seperate container
	_start_lbl.rect_min_size = Vector2(100, 100)
	_start_lbl.text = "RPG DEMO"
	
	_set_buttons(_start_btn, "start")
	_set_buttons(_load_btn, "load")
	_set_buttons(_exit_btn, "exit")	
	
	
	
# todo: hard coded Vector's need to be scaled
func _set_buttons(btn: Button, type: String) -> void:
	if (type == "start"):
		btn.text = "START GAME"		
		btn.rect_min_size = Vector2(50, 50)
		if (btn.connect("pressed", self, "_start_pressed") != OK):
			_handle_errors("Event are not connected")
	elif (type == "load"):
		btn.text = "LOAD GAME"		
		btn.rect_min_size = Vector2(50, 50)
		if (btn.connect("pressed", self, "_load_pressed") != OK):
			_handle_errors("Event are not connected")
	elif(type == "exit"):
		btn.text = "EXIT GAME"		
		btn.rect_min_size = Vector2(50, 50)
		if (btn.connect("pressed", self, "_exit_pressed") != OK):
			_handle_errors("Event are not connected")
	
	
	
	
# todo: may want to do more here
func _handle_errors(message: String) -> void:
	_log.print_to_log(message)
	
	
	
	
	
	
	
	
	
	
