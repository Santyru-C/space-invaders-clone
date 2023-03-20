extends Area2D
var test_enemy = preload("res://scenes/actors/enemies/Enemy1.tscn")
var direction = 1

func get_colored_brick(color):
	var formated_string = "res://scenes/%s_brick.tscn" % color
	var colored_brick_scene = load(formated_string)
	var colored_brick = colored_brick_scene.instance()
	return colored_brick
	
func place_invader(invader, position_x, position_y):
	invader.set_position(Vector2(position_x, position_y))
	call_deferred("add_child", invader)
	
func generate_enemy_fleet():
	var row_enemy_pattern = ["1", "2", "2", "3", "3"]
	var position_y = 48
	# var current_color = ""
	for row in 5:
		var position_x = 74
		# current_color = row_color_patter4n[row]
		for column in 11:
			if column != 1:
				position_x += 80
			var enemy = test_enemy.instance()
			place_invader(enemy, position_x, position_y)
			
		position_y += 64

func _ready():
	generate_enemy_fleet()

func _process(delta):
	pass


func _on_Timer_timeout():
	position += transform.x * -10 * direction


func _on_InvaderFleet_area_entered(area):
	if "Trigger" in area.get_name():
		direction *= -1
		position += transform.y * 4
	
