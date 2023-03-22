extends Area2D

export(PackedScene) var proyectile_scene
export(int) var speed = 400

func shoot():
	var proyectile = proyectile_scene.instance()
	get_tree().get_root().add_child(proyectile)
	print(get_tree().get_root().get_name())
	proyectile.position = $Position2D.global_position
