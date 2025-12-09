extends Area3D

var pollinated_count = 0
var particles: GPUParticles3D 
var unbloomed_mesh: MeshInstance3D
var bloomed_mesh: Node3D

func _ready() -> void:
	particles = $GPUParticles3D
	unbloomed_mesh = get_node("12974CrocusFlowerV1L4")
	bloomed_mesh = $BloomedMesh2
	bloomed_mesh.transform = unbloomed_mesh.transform
	bloomed_mesh.visible = false
	
func _bee_click():
	print("Flower clicked:")
	print("Pollination triggered")
	particles.restart()
	unbloomed_mesh.visible = false;
	bloomed_mesh.visible = true;
	if particles.draw_pass_1:
		particles.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON
	if pollinated_count == 0:
		pollinated_count = 1
	print("Number pollinated: ", pollinated_count)
	get_parent()._all_flowers_pollinated()
	return pollinated_count
	
