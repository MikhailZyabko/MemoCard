extends Resource

class_name  Weapon

@export var cooldown:float
@export var spread_angle:float

var origintransform:Transform3D
var originpos:Vector3
var originbasis:Basis
var originrotate:Vector3
var isfiring = false
var oncooldown = false

func initialize() -> void:
	pass

func pull_triger(_scene:SceneTree) -> void:
	pass

func release_triger() -> void:
	pass

func setcooldown(scene:SceneTree) -> void:
	oncooldown = true
	var t = scene.create_timer(cooldown)
	await t.timeout
	oncooldown = false
