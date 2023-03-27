extends CanvasLayer
signal start_game

func update_ScoreLabel(value):
	$ScoreLabel.text = "Score: %s" % value

func update_LifeLabel(value):
	$LifeLabel.text = "Life: %s" % value
	
func _ready():
	$LifeLabel.hide()
	$ScoreLabel.hide()

func toggle_display():
	var HUD_children = self.get_children()
	for child in HUD_children:
		if child.is_visible_in_tree():  #There's no ternary operator in GDScript
			child.hide()
		else:
			child.show()
			
func call_game_over_screen():
	$TitleLabel.text = "Game Over"
	toggle_display()

func _on_StartButton_pressed():
	emit_signal("start_game")
	toggle_display()
