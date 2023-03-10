extends KinematicBody2D

export(int) var speed = 400
# import bullet scene

var lifes = 3
var direction = Vector2()
var velocity = Vector2()

func shoot():
	pass
	
func get_input ():
	direction.x = 0
	if Input.is_action_pressed("ui_right"):
		direction.x = 1
	if Input.is_action_pressed("ui_left"):
		direction.x = -1
	if Input.is_action_pressed("ui_accept"):
		shoot() # and not bullet instance 
		
func _ready():
	pass

