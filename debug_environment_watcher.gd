extends Node

func _ready():
	var node = get_tree().current_scene
	var path = DebugEnvironmentLib.get_debug_path(node)
	if not FileAccess.file_exists(path): return
	var debug_env = load(path).instantiate()
	var target = debug_env.find_child("$DEBUG_TARGET$")
	if target == null: 
		node.add_child(debug_env)
	else:
		node.replace_by.call_deferred(debug_env)
		target.replace_by.call_deferred(node)
		target.free()