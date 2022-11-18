extends KinematicBody2D

export(int) var speed := 1
export(int) var max_health := 1
export(int) var attack := 1
export(float) var max_invincibility := 1.0

var firing := true
var invincible := false

onready var invincibility_timer := max_invincibility
onready var health := max_health


func _physics_process(delta: float):
	if invincible:
		invincibility_timer -= delta
		if invincibility_timer <= 0:
			invincible = false

	if self.health <= 0:
		# TODO: Game over
		self.firing = false
		return

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
	move_and_slide(direction * speed, Vector2.ZERO)


func damage(val: int):
	if not self.invincible:
		self.health -= val
		self.invincible = true
		self.invincibility_timer = max_invincibility


func fire():
	var spawned_bullet = $Bullet.create_instance()
	remove_child(spawned_bullet)
	get_parent().add_child(spawned_bullet)
	spawned_bullet.global_position = self.global_position
	spawned_bullet.direction = get_local_mouse_position()
	spawned_bullet.damage = attack


func _on_timeout():
	if self.firing:
		fire()
