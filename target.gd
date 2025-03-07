extends Area2D


func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body is not Player:
		body.queue_free()
	#body.queue_free()
