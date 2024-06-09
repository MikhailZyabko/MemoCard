extends Node3D

@export var weapon:Weapon

func _ready():
	weapon.initialize()

func _physics_process(delta):
	weapon.originpos = global_position
	weapon.originrotate = self.global_rotation/2

func start_firing():
	weapon.pull_triger(get_tree())

func stop_firing():
	weapon.release_triger()
