extends "res://scenes/actors/enemies/EnemyTemplate.gd"

func _physics_process(delta):
	position += transform.x * -speed * delta


func _on_VisibilityNotifier2D_screen_exited():
	self.queue_free()

# add this bad boy to the invader fleet
