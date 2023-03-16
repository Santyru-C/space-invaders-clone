extends Area2D

export(int) var proyectile_speed = 0

func _process(delta):
	position += transform.y * proyectile_speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	self.queue_free()
