extends Button

const _log = preload("res://src/utils/log.gd")


func _ready():
	_initialize()


func _initialize() -> void:
    text = "NEXT"
    rect_min_size = Vector2(50, 50)
    if (connect("pressed", self, "_move_next_pressed") != OK):
        _handle_errors("Event are not connected")


func _move_next_pressed() -> void:	
    emit_signal("_move_next")
            

func _handle_errors(message: String) -> void:
    _log.print_to_log(message)

