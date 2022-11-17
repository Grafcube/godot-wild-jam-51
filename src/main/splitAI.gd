extends Enemy


func fire():
	var start_dir: Vector2 = player.global_position - self.global_position
	var spawned_bullet1 = $Bullet.create_instance()
	var spawned_bullet2 = $Bullet.create_instance()
	remove_child(spawned_bullet1)
	remove_child(spawned_bullet2)
	get_parent().add_child(spawned_bullet1)
	get_parent().add_child(spawned_bullet2)
	spawned_bullet1.global_position = self.global_position
	spawned_bullet2.global_position = self.global_position
	spawned_bullet1.direction = start_dir.rotated(TAU / 30)
	spawned_bullet2.direction = start_dir.rotated(-TAU / 30)
