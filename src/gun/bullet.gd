extends Area2D

export(int) var speed := 1
var direction = Vector2.ZERO


func _process(delta):
	position += speed * delta * direction.normalized()


func _on_screen_exited():
	queue_free()
