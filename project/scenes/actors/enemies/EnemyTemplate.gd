extends "res://scenes/actors/ShipTemplate.gd"
export(int) var shot_interval = 1000
export(int) var score_amount = 0
signal ship_down
signal add_score(value)

func _process(_delta):
	if randi() % shot_interval == 1:
		shoot()

func _on_EnemyTemplate_area_entered(area):
	if "Bullet" in area.get_name():
		emit_signal("ship_down")
		emit_signal("add_score", score_amount)
		
		self.queue_free()
