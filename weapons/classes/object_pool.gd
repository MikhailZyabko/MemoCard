extends Node

class_name ObjectPool

var pool:Dictionary
var scene:PackedScene

func instantiate():
	var existingInstance = pool.get(scene, null)
	if existingInstance:
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
		print("Create")
		pool[scene] = [instance]
