extends "res://scenes/actors/ShipTemplate.gd"
export(int) var cadence = 1000
signal ship_down

func _process(_delta):
	if randi() % cadence == 1:
		shoot()
		pass

func _on_EnemyTemplate_area_entered(area):
	if "Bullet" in area.get_name():
		emit_signal("ship_down")
		self.queue_free()
