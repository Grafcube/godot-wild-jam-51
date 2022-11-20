extends Control

var is_game_over = false setget set_is_game_over

func set_is_game_over(val):
	is_game_over = val
	visible = is_game_over


func _on_ResumeButton_button_up():
	self.is_game_over = false
	get_tree().reload_current_scene()


func _on_QuitGame_button_up():
	get_tree().quit()
