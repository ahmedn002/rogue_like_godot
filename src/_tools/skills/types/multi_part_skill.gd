class_name  MultiPartSkill
extends Skill

var skills: Array[Skill]


func _action():
	for skill in skills:
		skill.execute()
