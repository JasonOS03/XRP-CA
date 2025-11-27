extends Node3D

var flower := preload("res://nature/source/flower.tscn");
var flower_rows := 3.0;
var flower_cols := 3.0;
var label: Label 
@export var total_flowers_pollinated: int = 0

func _ready() -> void:
	label = get_node("pollinated_count_label")
	label.text = "number pollinated: " + str(total_flowers_pollinated)
	for fl in range (flower_rows):
		for cols in range (flower_cols):
			var crocus_flower = flower.instantiate()
			crocus_flower.add_to_group("flower")
			crocus_flower.position = Vector3(fl*flower_rows,-0.5,cols*flower_cols)
			add_child(crocus_flower)
			print("flower location: ",crocus_flower.position)
		
		
func _all_flowers_pollinated():
	var total_flowers_pollinated = 0
	for crocus_flower in get_tree().get_nodes_in_group("flower"):
		total_flowers_pollinated += crocus_flower.pollinated_count
		
	label.text = "Flowers pollinated: " + str(total_flowers_pollinated)
		
	if total_flowers_pollinated >= get_tree().get_nodes_in_group("flower").size():
		print("you have pollinated all of the flowers")
	else:
		print("remaining flowers left to pollinate: ",get_tree().get_nodes_in_group("flower").size() - total_flowers_pollinated)
		
