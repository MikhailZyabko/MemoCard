extends CharacterBody3D

class_name Enemy

@export var speed = 5.0
@export var distance = 10

@onready var wc = $weapon_control

var target:Node

func _ready():
	target = get_tree().get_first_node_in_group("player")

func _physics_process(delta):
	look_at(target.global_position)
	var d = (target.global_position - global_position).length()
	var direction = (-transform.basis.z).normalized()
	if direction and d > distance:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		wc.stop_firing()
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
		wc.start_firing()

	move_and_slide()
