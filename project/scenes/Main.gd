extends Node
const player_scene = preload("res://scenes/actors/player/Player.tscn")
const invader_fleet_scene = preload("res://scenes/actors/enemies/InvaderFleet.tscn")
const player_position = Vector2(512, 536)
const fleet_position = Vector2(512, 16)

var current_player_instance = null
var score = 0

func _add_score(value):
	score += value
	$HUD.update_ScoreLabel(str(score))
	
func set_scene_instance(scene, pos):
	var scene_instance = scene.instance()
	scene_instance.set_position(pos)
	$Space.add_child(scene_instance)
	return scene_instance
	
func _on_player_hit():
	print(current_player_instance.lifes)
	$HUD.update_LifeLabel(current_player_instance.lifes)

func game_over():
	$Space.queue_free()
	$HUD.call_game_over_screen()
	
func _on_player_dead():
	game_over()
	
func new_game():
	score = 0
	var space = Node.new()
	space.name = "Space"
	self.add_child(space)
	current_player_instance = set_scene_instance(player_scene, player_position)
	current_player_instance.connect("player_hit", self, "_on_player_hit")
	current_player_instance.connect("player_dead", self, "_on_player_dead")
	set_scene_instance(invader_fleet_scene, fleet_position)
	$HUD.update_LifeLabel(str(current_player_instance.lifes))
	$HUD.update_ScoreLabel(str(score))

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function bod

func _on_HUD_start_game():
	new_game()
