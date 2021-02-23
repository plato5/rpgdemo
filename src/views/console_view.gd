extends TextureRect

onready var _console_image: ImageTexture
onready var _window_size: Vector2

onready var _console_header: VBoxContainer
onready var _console_content: VBoxContainer
onready var _console_actions: HBoxContainer

onready var _console_header_text: Label
onready var _console_text: RichTextLabel

onready var _console_move_btn: Button
onready var _console_quit_btn: Button

signal _move_next()
signal _exit_game()

# static classes
const _image_handler = preload("res://src/utils/image_handler.gd")
const _math = preload("res://src/utils/math.gd")
const _log = preload("res://src/utils/log.gd")

var _current_size: Vector2


func _ready():
	_initialize()


func _initialize() -> void:
	_set_size_from_window()
	_set_console_view()	
	_set_console_header()	
	_set_console_content()
	_set_console_actions()
	

func _move_next_pressed() -> void:	
	emit_signal("_move_next")
	
	
func _quit_game_pressed() -> void:
	_handle_errors("console_view: clicked")
	emit_signal("_exit_game")
	
	
func _set_console_view() -> void:
	_current_size = _math.scale_node_dimension(_window_size, 0.65)	
	rect_size = _current_size			
	rect_position = _math.position_node_to_parent(_window_size, 0.30, 0.30)	
	
	_console_image = _image_handler.set_image_texture_to_scale(_current_size, "res://assets/images/backgrounds/console/console1.jpg")						
	texture = _console_image
	
	
func _set_console_header() -> void:
	_console_header = get_node("console_header")
	_console_header.rect_size = _math.scale_node_dimension(_current_size, 0.30)
	_console_header.rect_position = _math.position_node_to_parent(_current_size, 0.57, 0.03)
	_set_console_header_text()

		
func _set_console_content() -> void:
	_console_content = get_node("console_content")
	_console_content.rect_size = _math.scale_node_dimension(_current_size, 0.65)
	_console_content.rect_position = _math.position_node_to_parent(_current_size, 0.40, 0.60)	
	_set_console_text()
	
		
func _set_console_actions() -> void:
	_console_actions = get_node("console_actions")
	_console_actions.rect_size = _math.scale_node_dimension(_current_size, 0.03)
	_console_actions.rect_position = _math.position_node_to_parent(_current_size, 1.50, 1.60)	
	_set_console_action_btns()
	
	

func _set_console_header_text() -> void:
	_console_header_text = get_node("console_header/console_header_text")
	_console_header_text.align = Label.ALIGN_CENTER
	_console_header_text.text = "THE LONG AND WINDING ROAD"
		
	
func _set_console_text() -> void:
	_console_text = get_node("console_content/console_text")
	_console_text.rect_min_size = _math.scale_node_dimension(_current_size, 0.65)	
	_console_text.text = "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc."
	
	
func _set_console_action_btns() -> void:
	_console_move_btn = get_node("console_actions/console_move_btn")
	_console_move_btn.text = "NEXT"
	_console_move_btn.rect_min_size = Vector2(50, 50)
	if (_console_move_btn.connect("pressed", self, "_move_next_pressed") != OK):
		_handle_errors("Event are not connected")
	
	# todo: this should be exit instead of quit
	_console_quit_btn = get_node("console_actions/console_quit_btn")
	_console_quit_btn.text = "QUIT"
	_console_quit_btn.rect_min_size = Vector2(50, 50)
	if (_console_quit_btn.connect("pressed", self, "_quit_game_pressed") != OK):
		_handle_errors("Event are not connected")
	
			
func _set_size_from_window() -> void:
	_window_size = get_viewport().size	
	
	
func _handle_errors(message: String) -> void:
	_log.print_to_log(message)
	
