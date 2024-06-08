extends Area3D

class_name Bullet

@export var speed = 5.0
@export var damage = 1.0

func _process(delta):
	translate(-global_transform.basis.z * speed * delta)
