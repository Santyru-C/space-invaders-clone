extends "res://scenes/actors/ShipTemplate.gd"
export(int) var cadence = 150

func _process(_delta):
	if randi() % cadence == 1:
		shoot()
