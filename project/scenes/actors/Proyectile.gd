extends Area2D

export(int) var proyectile_speed = 0

func _process(delta):
	position += transform.y * proyectile_speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	self.queue_free()


func _on_Proyectile_area_entered(area):
	if !("InvaderFleet" in area.get_name()):
		self.queue_free()

		area.queue_free()
	
	
