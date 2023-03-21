extends Area2D
const fleet_column_scene = preload("res://scenes/actors/enemies/FleetColumn.tscn")
var direction = 1

func get_colored_brick(color):
	var formated_string = "res://scenes/%s_brick.tscn" % color
	var colored_brick_scene = load(formated_string)
	var colored_brick = colored_brick_scene.instance()
	return colored_brick

func place_invader(invader, position_x):
	invader.set_position(Vector2(position_x, 48))
	call_deferred("add_child", invader)
	
func generate_enemy_fleet():
		var position_x = -396
		for column in 11:
			if column != 1:
				position_x += 72
			var fleet_column = fleet_column_scene.instance()
			place_invader(fleet_column, position_x)
func _ready():
	generate_enemy_fleet()

func _process(delta):
	pass


func _on_Timer_timeout():
	position += transform.x * -10 * direction


func _on_InvaderFleet_area_entered(area):
	pass
	#if "Trigger" in area.get_name():
	#	direction *= -1
	#	position += transform.y * 4
	
