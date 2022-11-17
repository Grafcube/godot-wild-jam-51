extends Enemy


func fire():
	var start_dir: Vector2 = player.global_position - self.global_position
	start_dir = start_dir.rotated(-TAU / 15)
	for i in range(5):
		var spawned_bullet = $Bullet.create_instance()
		remove_child(spawned_bullet)
		get_parent().add_child(spawned_bullet)
		spawned_bullet.global_position = self.global_position
		spawned_bullet.direction = start_dir.rotated(i * TAU / 30)
