extends Area3D

var pollinated_count = 0

func _bee_click():
	print("Pollination triggered")
	pollinated_count += 1
	print("Number pollinated: ", pollinated_count)
