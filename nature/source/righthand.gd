extends XRController3D


func _ready() -> void:
	var pointer = $righthand/FunctionPointer
	pointer.enabled = true
	pointer.distance = 20.0
	pointer.show_laser = XRToolsFunctionPointer.LaserShow.SHOW
	pointer.active_button_action = "godot/ax_button"

	# Connect the pointer signal
	pointer.pointing_event.connect(_on_pointer_event)



func _on_pointer_event(event: XRToolsPointerEvent) -> void:
 
	# Debug print to see what comes in
	var type_change = event.event_type
	if event.event_type == 0:
		type_change = XRToolsPointerEvent.Type.PRESSED
	elif event.event_type == 1:
		type_change = XRToolsPointerEvent.Type.RELEASED
	elif event.event_type == 4:
		type_change = XRToolsPointerEvent.Type.MOVED
	# Handle A button press
	if type_change == XRToolsPointerEvent.Type.PRESSED:
		print("A button press detected via signal")
		var target = event.target
		var triggered = false
		while target:
			if target and target.has_method("_bee_click"):
				target._bee_click()
				print("Calling _bee_click on:", target.name)
				triggered = true
				break
			target = target.get_parent()
		if not triggered and event.target and event.target.is_in_group("ground"):
			print("Teleporting...")
			var bee_root = get_tree().get_current_scene().get_node("PlayerRig")
			var teleport_tween = get_tree().create_tween()
			teleport_tween.tween_property(bee_root,"global_transform:origin",event.position,0.7)
			teleport_tween.set_trans(Tween.TRANS_SINE)
			teleport_tween.set_ease(Tween.EASE_IN_OUT)
			print("Teleported to:", bee_root.global_transform.origin)
			
		if not triggered and event.target and event.target.is_in_group("monument"):
			while event.target:
				if event.target.has_method("_monument_click"):
					event.target._monument_click()
					print("calling _monument_click on: ", event.target.name)
					break
				event.target = event.target.get_parent()
