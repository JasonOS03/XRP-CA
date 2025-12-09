extends Node3D

var flower := preload("res://nature/source/flower.tscn")
var tree := preload("res://detailed_tree.tscn")
var flower_rows := 4
var flower_cols := 4
var count_label: Label3D
@export var total_flowers_pollinated: int = 0
var tree_rows := 10

func _ready() -> void:

	count_label = get_node("PlayerRig/BeeRoot/XRCamera3D/Label3D")
	count_label.text = "Pollinated Count: %d" % total_flowers_pollinated
	var bee_root = get_node("PlayerRig/BeeRoot")
	print("Bee position: ",bee_root.global_transform.origin)
	var offset_x = 2 * 2.0 / 2.0
	var offset_z = 2 * 2.0 / 2.0
	var ground_y = $ground.global_transform.origin.y
	play_sounds()

	for fl in range(flower_rows):
		for cols in range(flower_cols):
			var crocus_flower = flower.instantiate()
			crocus_flower.add_to_group("flower")
			crocus_flower.position = Vector3(fl * 2.0-offset_x,ground_y + 0.1,-(cols*2.0-offset_z) - 6.0)
			add_child(crocus_flower)
			print("flower location: ", crocus_flower.position)

	var stone_monument = get_node("Stone_monument")
	stone_monument.add_to_group("monument")
	stone_monument.position = Vector3(0.0, ground_y + 0.1,-10.0)


func _all_flowers_pollinated():
	count_label = get_node("PlayerRig/BeeRoot/XRCamera3D/Label3D")
	total_flowers_pollinated = 0
	for crocus_flower in get_tree().get_nodes_in_group("flower"):
		total_flowers_pollinated += crocus_flower.pollinated_count

	count_label.text = "Pollinated Count: %d" % total_flowers_pollinated

	if total_flowers_pollinated >= get_tree().get_nodes_in_group("flower").size():
		print("you have pollinated all of the flowers")
		var game_won_music = get_node_or_null("victory_music")
		game_won_music.play()
		count_label.text = str("All flowers pollinated!")
	else:
		print("remaining flowers left to pollinate: ",
			  get_tree().get_nodes_in_group("flower").size() - total_flowers_pollinated)

func play_sounds() -> void:
	var garden_music = get_node_or_null("garden_music")
	garden_music.stream.loop = true
	garden_music.play()
	var bee_sounds = get_node_or_null("PlayerRig/BeeRoot/buzzing_sounds")
	bee_sounds.stream.loop = true
	bee_sounds.play()
	
func spawn_trees() -> void:
	var ground_y_position = $ground.global_transform.origin.y
	for trees in range(tree_rows):
		var spawned_tree = tree.instantiate()
		spawned_tree.add_to_group("tree")
		spawned_tree.position = Vector3(randf_range(-20,20),ground_y_position + 0.1,40)
		
		

	
	
		
