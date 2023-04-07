extends "res://scenes/actors/ShipTemplate.gd"
signal player_hit
signal player_dead

var lifes = 3
var direction = Vector2()

func get_input ():
	direction.x = 0
	if Input.is_action_pressed("ui_right"):
		direction.x = 1
	if Input.is_action_pressed("ui_left"):
		direction.x = -1
	if Input.is_action_just_pressed("ui_accept"):
		if !get_tree().get_root().has_node("Bullet"):
			shoot()
			
func _physics_process(delta):
	get_input()
	position += transform.x * direction * speed * delta
	speed = 400
	
func life_down():
	lifes -= 1
	if lifes == 0:
		self.queue_free()
		emit_signal("player_dead")

func _on_Player_area_entered(area):
	print(area)
	if "Beam" in area.get_name():
		life_down()
		emit_signal("player_hit")
		
	if "Enemy" in area.get_name():
		self.queue_free()
		emit_signal("player_dead")
		
