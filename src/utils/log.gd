class_name Log extends Reference

static func print_to_log(message: String) -> void:
	if (ProjectSettings.get_setting("logging/file_logging/enable_file_logging")):
		var dt = OS.get_datetime()
		print("%02d:%02d:%02d " % [dt.hour,dt.minute,dt.second], message)


