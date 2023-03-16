extends KinematicBody2D

export(int) var bullet_speed = 400
var direction = Vector2(0, -1)

func _physics_process(delta):
	var velocity = direction * bullet_speed
	var _collision = move_and_collide(velocity * delta)
	
func _ready():
	pass # Replace with function body.

func _on_VisibilityNotifier2D_screen_exited():
	self.queue_free()
