extends Node

class_name ObjectPool

var pool:Dictionary
var scene:PackedScene

func add(count:int):
	for i in count:
		var existingInstance = pool.get(scene, null)
		var instance = scene.instantiate()
		if existingInstance:
			pool[scene].push_back(instance)
		else:
			pool[scene] = [instance]

func instantiate():
	var existingInstance = pool.get(scene, null)
	if existingInstance:
		print("take")
		var instance = existingInstance.pop_back()
		if existingInstance.size() == 0:
			pool.erase(scene)
		return instance
	else:
		var instance = scene.instantiate()
		return instance

func return_instabce(instance):
	var existingInstance = pool.get(scene, null)
	if existingInstance:
		pool[scene].push_back(instance)
	else:
		pool[scene] = [instance]
