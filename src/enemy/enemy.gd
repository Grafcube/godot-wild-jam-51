class_name Enemy
extends KinematicBody2D

export(int) var speed := 1

onready var target := self.global_position


func _physics_process(_delta) -> void:
	# warning-ignore:return_value_discarded
	move_and_slide((target - self.global_position) * speed)


func _on_timeout() -> void:
	var spawned_bullet = $Bullet.create_instance()
	remove_child(spawned_bullet)
	get_parent().add_child(spawned_bullet)
	spawned_bullet.global_position = self.global_position
	var player = get_tree().get_nodes_in_group("player")[0]
	spawned_bullet.direction = player.global_position - self.global_position
