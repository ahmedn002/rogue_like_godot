class_name InputListeningMovementBehavior
extends MovementBehavior

func  _get_direction() -> Vector2:
	var direction: Vector2 = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up"),
	)
	
	_store_direction_if_not_stopped(direction)
	
	return direction.normalized()
