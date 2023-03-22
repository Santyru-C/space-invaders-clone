extends Area2D
const fleet_column_scene = preload("res://scenes/actors/enemies/FleetColumn.tscn")
var fleet_columns = 11
var direction = 1

func _on_column_area_entered(area):
	if "Trigger" in area.get_name():
		print("entered: ", area)
		direction *= -1
		position += transform.y * 5

func _on_column_down():
	fleet_columns -= 1
	if fleet_columns == 0:
		self.queue_free()
	
func place_invader(invader, position_x):
	invader.set_position(Vector2(position_x, 48))
	self.add_child(invader)
	#call_deferred("add_child", invader)
	
func generate_enemy_fleet():
		var position_x = -362
		for column in 11:
			if column != 0:
				position_x += 72
			var fleet_column = fleet_column_scene.instance()
			fleet_column.connect("area_entered", self, "_on_column_area_entered")
			fleet_column.connect("column_down", self, "_on_column_down")
			place_invader(fleet_column, position_x)
			
func _ready():
	generate_enemy_fleet()
	print(self.get_children())

func _on_Timer_timeout():
	position += transform.x * -10 * direction


func _on_InvaderFleet_area_entered(_area):
	pass
	#if "Trigger" in area.get_name():
	#	direction *= -1
	#	position += transform.y * 4
	

