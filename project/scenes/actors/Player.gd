extends KinematicBody2D

export(int) var speed = 400

func get_input ():
	direction.x = 0
	if Input.is_action_pressed("ui_right"):
		direction.x = 1
	if Input.is_action_pressed("ui_left"):
		direction.x = -1
func _ready():
	pass

