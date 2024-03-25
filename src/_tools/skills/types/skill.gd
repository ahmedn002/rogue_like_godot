class_name Skill
extends Node


@export var skill_name: String
@export var description: String
@export var cooldown: int # milliseconds
@export var input_activatable: bool
@export var input_event: String
var is_on_cooldown: bool = false
var movement_manager: MovementManager # For skills that alter movement


func execute() -> void:
	if is_on_cooldown:
		return
	_action()
	is_on_cooldown = true
	await get_tree().create_timer(cooldown / 1000.0).timeout
	is_on_cooldown = false


func _action() -> void:
	pass
