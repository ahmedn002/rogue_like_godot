class_name Dash
extends Buff

const DASH_RANGE: float = 600.0


func _init() -> void:
	duration = 200

func _action() -> void:
	var direction = movement_manager.movement_behavior._get_direction()
	
	if direction == Vector2.ZERO:
		direction = movement_manager.movement_behavior.last_facing_direction
	
	var velocity_override: Vector2 = direction * DASH_RANGE
	
	movement_manager._start_velocity_override(velocity_override)
	print('Velocity overriden: ', movement_manager.velocity_override)
	
	await get_tree().create_timer(duration / 1000).timeout
	
	movement_manager._end_velocity_override()
	print('Velocity override reset: ', movement_manager.velocity_override)

