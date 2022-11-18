extends Timer

onready var player: Node = get_tree().get_nodes_in_group("player")[0]


func _on_timeout() -> void:
	$Timer.start()
	_on_Timer_timeout()


func _on_Timer_timeout() -> void:
	for turret in get_children():
		if turret is Turret and turret.get_overlapping_bodies().has(player):
			var spawned_bullet = turret.bullet.create_instance()
			spawned_bullet.global_position = turret.global_position
			spawned_bullet.direction = player.global_position - turret.global_position
			spawned_bullet.ignore = "mob"
			spawned_bullet.target = "player"
			spawned_bullet.speed = 600
