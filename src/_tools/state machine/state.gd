class_name State
extends Node


var animation_tree : ActorAnimationTree
var movement_manager: MovementManager


func _ready() -> void:
	set_physics_process(false)


func _enter_state() -> void:
	set_physics_process(true)


func _exit_state() -> void:
	set_physics_process(false)


func _get_velocity() -> Vector2:
	return movement_manager._get_velocity()


func _get_direction() -> Vector2:
	return movement_manager.movement_behavior._get_direction()
