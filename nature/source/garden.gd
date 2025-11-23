extends Node3D

var flower := preload("res://nature/source/flower.tscn");
var flower_rows := 3.0;
var flower_cols := 3.0;

func _ready() -> void:
	for fl in range (flower_rows):
		for cols in range (flower_cols):
			var crocus_flower = flower.instantiate()
			crocus_flower.position = Vector3(fl*flower_rows,-0.5,cols*flower_cols)
			add_child(crocus_flower)
			print("flower location: ",crocus_flower.position)
		
		
		
		
