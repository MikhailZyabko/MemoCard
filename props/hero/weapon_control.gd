extends Node3D

@export var weapon:Weapon

func _physics_process(delta):
	weapon.originpos = global_position
	weapon.originrotate = self.global_rotation/2
	if Input.is_action_just_pressed("ui_accept"):
		weapon.pull_triger(get_tree())
	if Input.is_action_just_released("ui_accept"):
		weapon.release_triger()
