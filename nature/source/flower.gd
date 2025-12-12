extends Area3D

var pollinated_count = 0
var particles: GPUParticles3D 
var unbloomed_mesh: MeshInstance3D
var bloomed_mesh: Node3D

func _ready() -> void:
	particles = $GPUParticles3D
	unbloomed_mesh = get_node("12974CrocusFlowerV1L4")
	bloomed_mesh = $BloomedMesh2
	bloomed_mesh.transform = unbloomed_mesh.transform # set the bloomed mesh's transform to be the same as the unbloomed mesh's transform
	bloomed_mesh.visible = false # make the bloomed mesh invisible initially
	
func _bee_click():
	print("Flower clicked:")
	# if not already visible
	if not bloomed_mesh.visible:
		print("Flower not yet bloomed: Pollination triggered")
		particles.restart() # start the particles
		unbloomed_mesh.visible = false; # unbloomed mesh invisible
		bloomed_mesh.visible = true; # bloomed mesh is visible
		bloomed_mesh.scale = Vector3(0.01,0.01,0.01) # overwrite the scale value
		# cast shadows for the particles if first draw pass is enabled
		if particles.draw_pass_1:
			particles.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON
		# ensures count starts at 1 when first flower is pollinated
		if pollinated_count == 0:
			pollinated_count = 1
		print("Number pollinated: ", pollinated_count)
		get_parent()._all_flowers_pollinated() # call the all flowers pollinated method to check if all of the flowers have been pollinated
	return pollinated_count
	
