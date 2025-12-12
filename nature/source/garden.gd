extends Node3D
# load the flower, tree and sign scenes
var flower := preload("res://nature/source/flower.tscn")
var tree := preload("res://detailed_tree.tscn")
var wooden_sign := preload("res://woodensign2.tscn")
var flower_rows := 4 # set the number of rows for the flower grid
var flower_cols := 4 # set the number of columns for the flower grid
var count_label: Label3D
@export var total_flowers_pollinated: int = 0
var tree_rows := 30 # number of trees

func _ready() -> void:
	# get the label and assign it the total number of flowers pollinated and the text
	count_label = get_node("PlayerRig/BeeRoot/XRCamera3D/Label3D")
	count_label.text = "Pollinated Count: %d" % total_flowers_pollinated
	# get the bee node and print its position
	var bee_root = get_node("PlayerRig/BeeRoot")
	print("Bee position: ",bee_root.global_transform.origin)
	# set offsets for the x and y positions
	var offset_x = 2 * 2.0 / 2.0
	var offset_z = 2 * 2.0 / 2.0
	var ground_y = 0.0
	play_sounds() # call the play_sounds() function so the garden music and buzzing sounds will play
	
	# for each flower in the grid 
	for fl in range(flower_rows):
		for cols in range(flower_cols):
			var crocus_flower = flower.instantiate() # instantiate the flower
			crocus_flower.add_to_group("flower") # add to the flower group
			# set the x, y and z positions
			crocus_flower.position = Vector3(fl * 2.0-offset_x,ground_y,-(cols*2.0-offset_z) - 6.0)
			# add the flower as a child of the garden
			add_child(crocus_flower)
			print("flower location: ", crocus_flower.position)

	var stone_monument = get_node("Stone_monument") # get stone monument node
	stone_monument.add_to_group("monument") # add to group called monument
	stone_monument.position = Vector3(0.0, ground_y,-16.0) # set the x, y and z positions
	
	# call the functions to spawn the trees and the sign
	spawn_trees()
	spawn_sign()

# function to check if all of the flowers have been pollinated or not
func _all_flowers_pollinated():
	count_label = get_node("PlayerRig/BeeRoot/XRCamera3D/Label3D")
	total_flowers_pollinated = 0
	# for each flower add the individual flowers pollinated count to the total pollinated
	for crocus_flower in get_tree().get_nodes_in_group("flower"):
		total_flowers_pollinated += crocus_flower.pollinated_count
	# display the total number of flowers polinated so far 
	count_label.text = "Pollinated Count: %d" % total_flowers_pollinated

	# if the number of flowers pollinated is greater than or equal to the number of flowers
	if total_flowers_pollinated >= get_tree().get_nodes_in_group("flower").size():
		print("you have pollinated all of the flowers")
		var game_won_music = get_node_or_null("victory_music") # get victory node or get null if not found
		game_won_music.play() # play the game won music
		count_label.text = str("All flowers pollinated!") # update the Label3D
	else:
		# print the remaining number of flowers to be pollinated (grid size - total)
		print("remaining flowers left to pollinate: ",
			  get_tree().get_nodes_in_group("flower").size() - total_flowers_pollinated)

func play_sounds() -> void:
	var garden_music = get_node_or_null("garden_music")
	garden_music.stream.loop = true # ensure the music continuously plays on loop
	garden_music.play() # play the music
	var bee_sounds = get_node_or_null("PlayerRig/BeeRoot/buzzing_sounds")
	bee_sounds.stream.loop = true # loop the buzzing sounds
	bee_sounds.play() # play the buzzing sounds
	
func spawn_trees() -> void:
	# set the y position as the ground position
	var ground_y_position = 0.0
	# for each tree in the total trees
	for trees in range(tree_rows):
		var spawned_tree = tree.instantiate() # instantiate the trees
		add_child(spawned_tree) # add to the garden scene
		spawned_tree.add_to_group("tree") # add to group named tree
		# spawn trees in front of the bee with a z position of 40 
		spawned_tree.position = Vector3(randf_range(-60,60),ground_y_position,40)
		
	for trees in range(tree_rows):
		var spawned_tree = tree.instantiate()
		add_child(spawned_tree)
		spawned_tree.add_to_group("tree")
		# spawn trees in front of the bee but slightly forward
		spawned_tree.position = Vector3(randf_range(-60,60),ground_y_position,30)
		
	for trees in range(tree_rows):
		var spawned_tree = tree.instantiate()
		add_child(spawned_tree)
		spawned_tree.add_to_group("tree")
		# spawn trees behind the bee
		spawned_tree.position = Vector3(randf_range(-60,60),ground_y_position,-40)
		
	for trees in range(tree_rows):
		var spawned_tree = tree.instantiate()
		add_child(spawned_tree)
		spawned_tree.add_to_group("tree")
		# row of trees on the right side of the bee 
		spawned_tree.position = Vector3(40,ground_y_position,randf_range(-60,60))
		
	for trees in range(tree_rows):
		var spawned_tree = tree.instantiate()
		add_child(spawned_tree)
		spawned_tree.add_to_group("tree")
		# row of trees to the left side of the bee
		spawned_tree.position = Vector3(-40,ground_y_position,randf_range(-60,60))
		
func spawn_sign() -> void:
	var ground_y_position = 0.0
	var spawned_sign = wooden_sign.instantiate() # instantiate the sign
	add_child(spawned_sign)
	spawned_sign.add_to_group("sign") # add to the group named sign
	# spawn the sign at random x and z positions within a specified range
	spawned_sign.position = Vector3(randf_range(-20,40),ground_y_position,randf_range(-40,20))
	print("Sign location: ",spawned_sign.position)

	
	
		
