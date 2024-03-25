class_name MovementBehavior
extends Node

var last_direction_before_stopping: Vector2 = Vector2.ZERO
var last_facing_direction: Vector2 = Vector2(1, 0) # Right initially


func _get_direction() -> Vector2:
	push_error('UNINPLEMENTED METHOD: MovementBehavior._get_direction')
	return Vector2.ZERO


func _store_direction_if_not_stopped(direction: Vector2) -> void:
	if (direction != Vector2.ZERO):
		last_direction_before_stopping = direction
		
		if (direction.x != 0):
			direction.y = 0
			last_facing_direction = direction.normalized()
