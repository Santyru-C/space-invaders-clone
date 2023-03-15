extends KinematicBody2D

export(int) var speed = 400
var bullet_scene = preload("res://scenes/actors/Proyectile.tscn")

var lifes = 3
var direction = Vector2()
var velocity = Vector2()

func shoot():
	var bullet = bullet_scene.instance()
	get_parent().add_child(bullet)
	bullet.position = $Position2D.global_position
	
func get_input ():
	direction.x = 0
	if Input.is_action_pressed("ui_right"):
		direction.x = 1
	if Input.is_action_pressed("ui_left"):
		direction.x = -1
	if Input.is_action_just_pressed("ui_accept"):
		if !get_parent().has_node("Proyectile"):
			shoot()
		
func _ready():
	pass

func _physics_process(_delta):
	get_input()
	var _collision = move_and_slide(direction * speed)
