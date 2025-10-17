extends XRCamera3D

@onready var the_bee = get_node("../BeeRoot")

func _process(delta: float) -> void:
	if the_bee:
		global_transform.origin = the_bee.global_transform.origin
