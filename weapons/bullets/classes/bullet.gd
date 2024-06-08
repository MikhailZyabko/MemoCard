extends Area3D

class_name Bullet

@export var speed = 5.0
@export var damage = 1.0

var weapon:BulletWeapon
var scene:PackedScene
@onready var timer = $Timer

func poolready():
	timer.start()
	enable()

func set_weapon(w:BulletWeapon):
	weapon = w

func erase():
	timer.stop()
	weapon.bulletPool.return_instabce(self) 
	disable()

func _process(delta):
	translate(-global_transform.basis.z * speed * delta)

func _on_timer_timeout():
	erase()

func disable() -> void:
	process_mode = 4 # = Mode: Disabled
	hide()

func enable() -> void:
	process_mode = 0 # = Mode: Disabled
	show()
