extends "res://scenes/actors/ShipTemplate.gd"

var lifes = 3
var direction = Vector2()
var velocity = Vector2()

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

func life_down():
	lifes -= 1
	if lifes == 0:
		self.queue_free()

func _on_Player_area_entered(area):
	print(area)
	if "Beam" in area.get_name():
		life_down()
