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
	get_parent()._all_flowers_pollinated()
	return pollinated_count
	
