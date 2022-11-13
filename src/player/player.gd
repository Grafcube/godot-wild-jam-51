extends KinematicBody2D

export(int, 0, 12000) var speed: = 1

func _ready():
	pass
	
func _physics_process(delta):
	var direction: = Vector2.ZERO
	
	var input_strengths: Dictionary = {
	  "left": Input.get_action_strength("player_left"),
	  "right": Input.get_action_strength("player_right"),
	  "up": Input.get_action_strength("player_up"),
	  "down": Input.get_action_strength("player_down")
	}
	
	direction = Vector2(input_strengths.right - input_strengths.left,
				input_strengths.down - input_strengths.up)
	direction = direction.clamped(1.0)

	# warning-ignore:return_value_discarded
	move_and_slide(direction * speed * delta, Vector2.ZERO)
