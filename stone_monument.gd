extends Area3D

var stone_monument : Node3D

func _ready() -> void:
	stone_monument = get_node("Sketchfab_Scene/Sketchfab_model/Jikouji_1355_fbx/RootNode/Model")
	stone_monument.visible = true
	add_to_group("monument")
	
func _monument_click():
	print ("restart triggered")
	var tree = get_tree()
	tree.reload_current_scene()
	
	
	
