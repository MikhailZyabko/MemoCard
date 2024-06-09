extends Area3D

class_name Bullet

@export var speed = 5.0
@export var damage = 1.0

var pool:ObjectPool
var scene:PackedScene
@onready var timer = $Timer

func poolready():
	timer.start()
	enable()

func set_weapon(p:ObjectPool):
	pool = p

func erase():
	timer.stop()
	pool.return_instabce(self) 
	disable()

func _process(delta):
	translate(-global_transform.basis.z * speed * delta)

func _on_timer_timeout():
	erase()

func disable() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED # = Mode: Disabled
	hide()

func enable() -> void:
	process_mode = Node.PROCESS_MODE_INHERIT # = Mode: Disabled
	show()


func _on_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
		erase()
