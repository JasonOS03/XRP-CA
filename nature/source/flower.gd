extends Area3D

var pollinated_count = 0
var particles: GPUParticles3D

func _ready() -> void:
	particles = get_node("GPUParticles3D")

func _bee_click():
	print("Pollination triggered")
	particles.restart()
	if particles.draw_pass_1:
		particles.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON
	pollinated_count += 1
	print("Number pollinated: ", pollinated_count)
	_all_flowers_pollinated()
	return pollinated_count
	
func _all_flowers_pollinated():
	var total_flowers_pollinated = 0
	for crocus_flower in get_tree().get_nodes_in_group("flowers"):
		total_flowers_pollinated += crocus_flower.pollinated_count
	if total_flowers_pollinated == get_tree().get_nodes_in_group("flowers").size():
		print("you have pollinated all of the flowers")
	else:
		print("remaining flowers left to pollinate: ",get_tree().get_nodes_in_group("flowers").size() - total_flowers_pollinated)
