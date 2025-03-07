extends Player

var bullet_scene: PackedScene = preload("res://bullet.tscn")
@onready var bullet_spawnpoint = $Marker2D


func attack():
	var bullet_instance = bullet_scene.instantiate()
	bullet_instance.global_position = $Marker2D.global_position
	bullet_instance.change_initial_direction(face_direction)
	get_parent().add_child(bullet_instance)


func change_direction(direction: float):
	super.change_direction(direction)
	if direction == 1:
		bullet_spawnpoint.position.x = 64.0
	elif direction == -1:
		bullet_spawnpoint.position.x = -64.0
