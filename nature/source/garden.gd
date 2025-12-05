extends Node3D

var flower := preload("res://nature/source/flower.tscn")
var flower_rows := 3
var flower_cols := 3
var label: Label
@export var total_flowers_pollinated: int = 0

func _ready() -> void:

	label = get_node("pollinated_count_label")
	label.text = "number pollinated: " + str(total_flowers_pollinated)
	var bee_root = get_node("BeeRoot")
	print("Bee position: ",bee_root.global_transform.origin)
	var x_offset = 2 * 2.0 / 2.0
	var z_offset = 2 * 2.0 / 2.0
	var ground_y = $ground.global_transform.origin.y

	for fl in range(flower_rows):
		for cols in range(flower_cols):
			var crocus_flower = flower.instantiate()
			crocus_flower.add_to_group("flower")
			crocus_flower.position = Vector3(fl * 2.0-x_offset,ground_y + 0.3,-(cols*2.0-z_offset) - 6.0)
			add_child(crocus_flower)
			print("flower location: ", crocus_flower.position)

	var stone_monument = get_node("Stone_monument")
	stone_monument.add_to_group("monument")
	stone_monument.position = Vector3(0.0, ground_y + 0.3,-10.0)


func _all_flowers_pollinated():
	total_flowers_pollinated = 0
	for crocus_flower in get_tree().get_nodes_in_group("flower"):
		total_flowers_pollinated += crocus_flower.pollinated_count

	label.text = "Flowers pollinated: " + str(total_flowers_pollinated)

	if total_flowers_pollinated >= get_tree().get_nodes_in_group("flower").size():
		print("you have pollinated all of the flowers")
	else:
		print("remaining flowers left to pollinate: ",
			  get_tree().get_nodes_in_group("flower").size() - total_flowers_pollinated)

		

	
	
		
