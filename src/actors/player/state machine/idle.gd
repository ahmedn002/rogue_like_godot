class_name PlayerIdleState
extends State

signal moved


func _enter_state() -> void:
	super()
	animation_tree.set_animation(animation_tree.IDLE)


func _exit_state() -> void:
	super()


func _physics_process(_delta: float) -> void:
	if movement_manager.velocity != Vector2.ZERO:
		emit_signal("moved")
