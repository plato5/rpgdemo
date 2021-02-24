extends Button

onready var console_quit_func_property: FuncRef

const _log = preload("res://src/utils/log.gd")


func _ready():
	_initialize()


func _initialize() -> void:
    text = "QUIT"
    rect_min_size = Vector2(50, 50)
    if (connect("pressed", self, "_quit_game_pressed") != OK):
        _handle_errors("Event are not connected")


func _quit_game_pressed() -> void:    
    console_quit_func_property.call_func()
            

func _handle_errors(message: String) -> void:
    _log.print_to_log(message)


        