extends "res://scenes/actors/Proyectile.gd"


func _on_Beam_area_entered(area):
	if "Player" in area.get_name():
		self.queue_free()
