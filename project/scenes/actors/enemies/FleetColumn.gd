extends Area2D

var ships = 5

func get_enemy_type(type):
	var formated_string = "res://scenes/actors/enemies/Enemy%s.tscn" % type
	var enemy_scene = load(formated_string)
	var enemy = enemy_scene.instance()
	return enemy

func place_invader(invader, position_y):
	invader.set_position(Vector2(0, position_y))
	call_deferred("add_child", invader)
	
func generate_invader_column():
	var column_pattern = ["1", "2", "2", "3", "3"]
	var position_y = 0
	# var current_color = ""
	for row in 5:
		var current_enemy = get_enemy_type(column_pattern[row])
		place_invader(current_enemy, position_y)
		position_y += 56
	
func _ready():
	generate_invader_column()
