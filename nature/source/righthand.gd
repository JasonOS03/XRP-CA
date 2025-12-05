extends XRController3D


func _ready() -> void:
	var pointer = $righthand/FunctionPointer
	pointer.enabled = true
	pointer.distance = 20.0
	pointer.show_laser = XRToolsFunctionPointer.LaserShow.SHOW
	pointer.laser_length = XRToolsFunctionPointer.LaserLength.COLLIDE
	pointer.pointing_event.connect(_on_pointer_pressed)

func _on_pointer_pressed(Event:Variant) -> void:
	print(Event)
	if  Event.action == "primary_click" or Event.action == "a_button" or Event.action == "trigger_click" and Event.pressed:
		var target_area = Event.target
		print("button pressed")
		if target_area and target_area.has_method("_bee_click"):
			target_area._bee_click()
			print("Calling _bee_click on:", target_area.name)
		elif target_area and target_area.get_parent().has_method("_bee_click"):
			target_area.get_parent()._bee_click()
		elif target_area:
			print("teleporting...")
			var bee_root = get_parent()
			bee_root.global_transform.origin = Event.collision_point
			print("teleported")
