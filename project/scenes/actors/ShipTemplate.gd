extends Area2D

export(PackedScene) var proyectile_scene
export(int) var speed = 400

func shoot():
	var proyectile = proyectile_scene.instance()
	get_tree().get_root().add_child(proyectile)
	proyectile.position = $Position2D.global_position
