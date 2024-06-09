extends CharacterBody3D

@export var speed = 550.0

var target_velocity = Vector3.ZERO

func _physics_process(delta):
	var direction = Vector3.ZERO
	
	if (Input.is_action_pressed("move_left")):
		direction.x -= 1
	if (Input.is_action_pressed("move_right")):
		direction.x += 1
	if (Input.is_action_pressed("move_up")):
		direction.z -= 1
	if (Input.is_action_pressed("move_down")):
		direction.z += 1
		
	if direction != Vector3.ZERO:
		direction = direction.normalized()
	
	target_velocity.x = direction.x * speed * delta
	target_velocity.z = direction.z * speed * delta
	
	velocity = target_velocity
	print(velocity)
	move_and_slide()
