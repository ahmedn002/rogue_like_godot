class_name ActorAnimationTree
extends AnimationTree


const IDLE: String = "Idle"
const RUNNING: String = "Running"
const ATTACKING: String = "Attacking"
var machine: AnimationNodeStateMachinePlayback = get('parameters/playback')


func set_animation(state: String) -> void:
	machine.travel(state)
