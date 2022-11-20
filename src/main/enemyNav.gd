extends Navigation2D

onready var player: Node2D = get_tree().get_nodes_in_group("player")[0]


func _physics_process(_delta) -> void:
	for mob in get_tree().get_nodes_in_group("mob"):
		var path := get_simple_path(mob.position, player.position)
		mob.target = path[1 if path.size() > 1 else 0]
