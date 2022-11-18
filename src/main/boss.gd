extends Enemy


func _physics_process(_delta: float) -> void:
	# Requires navigation to be completed
	pass


func fire():
	if health > 40:
		$Bullet.speed = 600
		$Timer.wait_time = 0.2
		stream_fire()
	elif health > 20:
		$Bullet.speed = 400
		$Timer.wait_time = 0.1
		spread_fire(10)
	else:
		$Bullet.speed = 200
		$Timer.wait_time = 0.1
		radial_fire(8)


func stream_fire():
	var spawned_bullet = $Bullet.create_instance()
	remove_child(spawned_bullet)
	get_parent().add_child(spawned_bullet)
	spawned_bullet.global_position = self.global_position
	spawned_bullet.direction = player.global_position - self.global_position


func spread_fire(angle: int):
	var start_dir: Vector2 = player.global_position - self.global_position
	start_dir = start_dir.rotated(-TAU / angle)
	for i in range(5):
		var spawned_bullet = $Bullet.create_instance()
		remove_child(spawned_bullet)
		get_parent().add_child(spawned_bullet)
		spawned_bullet.global_position = self.global_position
		spawned_bullet.direction = start_dir.rotated(i * TAU / (angle * 2))


func radial_fire(div: int):
	var start_dir: Vector2 = player.global_position - self.global_position
	for i in range(div):
		var spawned_bullet = $Bullet.create_instance()
		remove_child(spawned_bullet)
		get_parent().add_child(spawned_bullet)
		spawned_bullet.global_position = self.global_position
		spawned_bullet.direction = start_dir.rotated(i * TAU / div)
