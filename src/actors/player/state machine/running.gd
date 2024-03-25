class_name PlayerRunningState
extends State

signal stopped


func _enter_state() -> void:
	super()
	animation_tree.set_animation(animation_tree.RUNNING)


func _physics_process(_delta: float) -> void:
	if movement_manager.velocity == Vector2.ZERO:
		emit_signal("stopped")
