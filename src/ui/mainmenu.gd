extends Control

export var main_game_scene: PackedScene 


func _on_StartButton_button_up():
	get_tree().change_scene(main_game_scene.resource_path)


func _on_CreditsButton_button_up():
	get_tree().quit()
