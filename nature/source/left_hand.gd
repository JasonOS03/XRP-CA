extends XRController3D


func _ready() -> void:
	var pointer = get_node("FunctionPointer")
	pointer.enabled = true
	pointer.distance = 10.0
	pointer.show_laser = XRToolsFunctionPointer.LaserShow.SHOW
	pointer.laser_length = XRToolsFunctionPointer.LaserLength.COLLIDE
