class_name Enemy
extends KinematicBody2D

export(int) var speed := 1

var fire_gun := false

onready var target := self.global_position
onready var player: Node = get_tree().get_nodes_in_group("player")[0]


func _physics_process(_delta) -> void:
	clear_shot()
	# warning-ignore:return_value_discarded
	move_and_slide((target - self.global_position) * speed)


func clear_shot():
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_ray(
		self.global_position, player.global_position, get_tree().get_nodes_in_group("mob")
	)
	if result.collider == player:
		fire_gun = true
	else:
		fire_gun = false


func fire():
	var spawned_bullet = $Bullet.create_instance()
	remove_child(spawned_bullet)
	get_parent().add_child(spawned_bullet)
	spawned_bullet.global_position = self.global_position
	spawned_bullet.direction = player.global_position - self.global_position


func _on_timeout() -> void:
	if fire_gun:
		fire()
