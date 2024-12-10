extends Node3D

@onready var player = $Player
const BEAR = preload("res://scenes/bear.tscn")

func _on_bear_spawner_timeout():
	var new_bear = BEAR.instantiate()
	while new_bear.position.distance_to(Vector3(0, 10, 0)) < 40 && new_bear.position.distance_to(player.position) < 20:
		new_bear.position = Vector3(randf_range(0, 165), 15, randf_range(0, 165))
	add_child(new_bear)
	
