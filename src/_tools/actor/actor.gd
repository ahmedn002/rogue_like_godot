class_name Actor
extends CharacterBody2D

@export var sprite: Sprite2D
@export var state_machine: FiniteStateMachine # Holds the movement manager


func _physics_process(_delta: float) -> void:
	_handle_sprite_horizontal_flipping()
	
	velocity = state_machine.state._get_velocity()
	move_and_slide()


func _handle_sprite_horizontal_flipping() -> void:
	var direction: Vector2 = state_machine.state._get_direction()
	if direction.x == 0: return
	sprite.flip_h = direction.x < 0
