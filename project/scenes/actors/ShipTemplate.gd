extends Area2D

export(PackedScene) var proyectile_scene
export(int) var speed = 400

func shoot():
	var proyectile = proyectile_scene.instance()
	get_parent().add_child(proyectile)
	proyectile.position = $Position2D.global_position

func get_input ():
	#direction.x = 0
	if Input.is_action_pressed("ui_right"):
		pass
		#direction.x = 1
	if Input.is_action_pressed("ui_left"):
		pass
		#direction.x = -1
	if Input.is_action_just_pressed("ui_accept"):
		if !get_parent().has_node("Bullet"):
			shoot()
		
func _ready():
	pass

func _physics_process(_delta):
	get_input()
