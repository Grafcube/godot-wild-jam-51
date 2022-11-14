extends KinematicBody2D

export(int) var speed := 1
export(int) var multiplier := 1


func _ready():
	pass


func _physics_process(_delta):
	var direction := Vector2.ZERO

	var input_strengths: Dictionary = {
		"left": Input.get_action_strength("player_left"),
		"right": Input.get_action_strength("player_right"),
		"up": Input.get_action_strength("player_up"),
		"down": Input.get_action_strength("player_down")
	}

	direction = Vector2(
		input_strengths.right - input_strengths.left, input_strengths.down - input_strengths.up
	)
	direction = direction.normalized()

	# warning-ignore:return_value_discarded
	move_and_slide(direction * speed * multiplier, Vector2.ZERO)


func _on_timeout():
	var spawned_bullet = $Bullet.create_instance()
	remove_child(spawned_bullet)
	get_parent().add_child(spawned_bullet)
	spawned_bullet.global_position = self.global_position
	spawned_bullet.direction = get_local_mouse_position()
