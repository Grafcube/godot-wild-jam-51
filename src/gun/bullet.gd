extends Area2D

export(int) var speed := 1
export(String) var ignore := ""
export(String) var target := ""

var direction = Vector2.ZERO
var damage := 1


func _process(delta):
	position += speed * delta * direction.normalized()


func _on_screen_exited():
	queue_free()


func _on_body_entered(body: Node) -> void:
	if body.is_in_group(target):
		body.damage(damage)
	if not body.get_groups().has(ignore):
		queue_free()
