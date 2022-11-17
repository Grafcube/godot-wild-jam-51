extends Enemy

var time := 0.0
var s := 1


func _physics_process(delta: float) -> void:
	time += delta
	if time >= 1:
		s = -s
		time = 0.0
	self.target = Vector2(self.global_position.x + (200 * s), self.global_position.y + (200 * -s))
