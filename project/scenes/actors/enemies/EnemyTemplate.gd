extends "res://scenes/actors/ShipTemplate.gd"
export(int) var shot_interval = 1000
export(int) var score_amount = 0
signal ship_down
signal add_score(value)
var current_position = Vector2()
var current_frame = 0
onready var _animated_sprite = $AnimatedSprite
export(int) var animation_frames = 0

func _process(_delta):
	if randi() % shot_interval == 1:
		shoot()
		

func _on_EnemyTemplate_area_entered(area):
	if "Bullet" in area.get_name():
		emit_signal("ship_down")
		emit_signal("add_score", score_amount)
		
		self.queue_free()
