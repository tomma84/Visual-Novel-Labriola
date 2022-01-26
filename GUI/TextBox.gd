extends TextureRect

signal animation_completed

func _end():
	emit_signal("animation_completed")
