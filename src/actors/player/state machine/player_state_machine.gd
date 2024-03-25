class_name PlayerStateMachine
extends FiniteStateMachine

@onready var idle: PlayerIdleState = $PlayerIdleState
@onready var running: PlayerRunningState = $PlayerRunningState

func _ready() -> void:
	super()
	idle.moved.connect(change_state.bind(running))
	running.stopped.connect(change_state.bind(idle))
