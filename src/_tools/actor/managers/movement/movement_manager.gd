class_name MovementManager
extends Node

@export var movement_speed: float = 100.0
@export var movement_behavior: MovementBehavior

var velocity: Vector2 = Vector2.ZERO

@warning_ignore("untyped_declaration") # Because it can be nullable
var velocity_override = null


func _get_velocity() -> Vector2:
	#print(velocity_override)
	if (velocity_override != null):
		return velocity_override as Vector2
	return movement_behavior._get_direction() * movement_speed


func _start_velocity_override(override: Vector2) -> void:
	velocity_override = override
	#print('Setting velocity override: ', velocity_override)


func _end_velocity_override() -> void:
	velocity_override = null


func _physics_process(_delta: float) -> void:
		velocity = _get_velocity()
