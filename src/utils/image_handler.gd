class_name ImageHandler extends Reference


static func set_image_texture_to_scale(current_scale: Vector2, image_path: String) -> ImageTexture:
	var texture_image: ImageTexture = ImageTexture.new()	
	var texture = load(image_path)	
	var image = texture.get_data()
	
	image.resize(current_scale.x, current_scale.y, 1)	
	texture_image.create_from_image(image)
	
	return texture_image
