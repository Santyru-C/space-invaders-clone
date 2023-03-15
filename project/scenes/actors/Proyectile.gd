extends KinematicBody2D

export(int) var bullet_speed = 400
var direction = Vector2(0, -1)

func _physics_process(delta):
	var velocity = direction * bullet_speed
	var collision = move_and_collide(velocity * delta)
	
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
