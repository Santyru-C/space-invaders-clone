extends Area2D
signal column_down
var ships = 5


func _on_ship_down():
	ships -= 1
	
	if ships == 0:
		self.queue_free()
		emit_signal("column_down")
		
func prepare_enemy_type(type):
	var formated_string = "res://scenes/actors/enemies/Enemy%s.tscn" % type
	var enemy_scene = load(formated_string)
	var enemy = enemy_scene.instance()
	enemy.connect("ship_down", self, "_on_ship_down")
	enemy.connect("add_score", get_tree().current_scene, "_add_score")
	return enemy

func place_invader(invader, position_y):
	invader.set_position(Vector2(0, position_y))
	call_deferred("add_child", invader)
	
func generate_invader_column():
	var column_pattern = ["1", "2", "2", "3", "3"]
	var position_y = 0
	
	for row in ships:
		var current_enemy = prepare_enemy_type(column_pattern[row])
		place_invader(current_enemy, position_y)
		position_y += 56
	
func _ready():
	generate_invader_column()
