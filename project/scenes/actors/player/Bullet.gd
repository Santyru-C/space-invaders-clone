extends "res://scenes/actors/Proyectile.gd"

func _on_Bullet_area_entered(area):
	if ("Enemy" in area.get_name()) or ("Beam" in area.get_name()) or "MotherShip" in area.get_name():
		self.queue_free()
