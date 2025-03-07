extends Area2D

@export var speed: float = 400
var direction: int = 1

func _physics_process(delta: float) -> void:
	position.x += direction * speed * delta


func change_initial_direction(new_direction: int):
	if new_direction == -1:
		$Sprite2D.flip_h = true
		direction = -1
