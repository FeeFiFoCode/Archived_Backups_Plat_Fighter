extends Label

func _physics_process(delta: float) -> void:
	set_text("FPS %d" % Engine.get_frames_per_second())
