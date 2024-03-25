class_name  SkillManager
extends Node

@export var movement_manager: MovementManager

var equipped_skills: Array[Skill] = []
var skills_queue: Array[Skill] = []


func _ready() -> void:
	for child: Node in get_children():
		if child is Skill:
			equipped_skills.append(child)
			child.movement_manager = movement_manager


func _manage_skill_enqueue(skill: Skill) -> void:
	if (skill.is_on_cooldown):
		# TODO: Notify user somehow that skill is on cooldown
		return
	
	if (not skill.input_activatable): # Should auto cast off cooldown
		print('Pushing skill off cooldown: ' + skill.to_string())
		skills_queue.push_back(skill)
	
	if (Input.is_action_pressed(skill.input_event)): # Received input for skill
		print('Pushing skill on input: ' + skill.to_string())
		skills_queue.push_back(skill)


func _manage_skill_queue() -> void:
	#print(skills_queue)
	if skills_queue.is_empty():
		return
	var skill: Skill = skills_queue.pop_front() as Skill
	skill.execute()


func _physics_process(delta: float) -> void:
	for skill: Skill in equipped_skills:
		_manage_skill_enqueue(skill)
	
	_manage_skill_queue()
