extends Area2D


func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		get_tree().get_nodes_in_group("barrier")[0].create_instance(true)
		queue_free()
