class_name FiniteStateMachine
extends Node

@export var state: State
@export var animation_tree: ActorAnimationTree
@export var movement_manager: MovementManager
var states: Array[State] = []

func _ready() -> void:
	for child: Node in get_children():
		if child is State:
			states.append(child)
			child.animation_tree = animation_tree
			child.movement_manager = movement_manager
	
	state._enter_state()


func change_state(new_state: State) -> void:
	if (new_state == state):
		return
	state._exit_state()
	new_state._enter_state()
	state = new_state


func _physics_process(_delta: float) -> void:
	pass
