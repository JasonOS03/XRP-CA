extends Area3D

var stone_monument : Node3D

func _ready() -> void:
	stone_monument = get_node("Sketchfab_Scene/Sketchfab_model/Jikouji_1355_fbx/RootNode/Model")
	stone_monument.visible = true # make the stone monument visible
	add_to_group("monument")
	
func _monument_click():
	print ("restart triggered")
	var tree = get_tree()
	tree.reload_current_scene() # reload the entire garden scene, which resets the flowers and the sign. Bee position goes back to the starting point
	 
	var restart_tween = create_tween() # create a tween for scene reloading
	# starts and ends quickly, slow in the middle
	restart_tween.set_ease(Tween.EASE_OUT_IN)
	
	
	
