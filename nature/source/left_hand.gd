extends XRController3D


func _ready() -> void:
	# left hand pointer
	var pointer = $lefthand/FunctionPointer
	pointer.enabled = true # enable function pointer 
	pointer.distance = 20.0 # set the distance
	pointer.show_laser = XRToolsFunctionPointer.LaserShow.SHOW # show the laser
	pointer.active_button_action = "godot/ax_button" # set the active button to be the ax_button, the left hand controller uses x

	# connect the on_pointer_event function with the signal pointing_event
	pointer.pointing_event.connect(_on_pointer_event)



func _on_pointer_event(event: XRToolsPointerEvent) -> void:
 
	# Check the event type 
	var type_change = event.event_type
	# if the event type index is O set as type PRESSED
	if event.event_type == 0:
		type_change = XRToolsPointerEvent.Type.PRESSED
	# if the index is 1 set as type released
	elif event.event_type == 1:
		type_change = XRToolsPointerEvent.Type.RELEASED
	# if the index is 4 set as type moved
	elif event.event_type == 4:
		type_change = XRToolsPointerEvent.Type.MOVED
		
	# if button is pressed
	if type_change == XRToolsPointerEvent.Type.PRESSED:
		print("Button press detected: A button")
		var target = event.target # set the target as the event target 
		var triggered = false # indicate _bee_click has not yet been triggered
		while target:
			if target and target.has_method("_bee_click"): # if target is a flower 
				target._bee_click() # call the targets _bee_click function
				print("Calling _bee_click on:", target.name)
				triggered = true # indicate _bee_click has been triggered
				break # break out of the loop
			target = target.get_parent() # climb up to the next parent node in the tree if the target does not have the method
		# if _bee_click has not been triggered and the target exists and is in the ground group
		if not triggered and event.target and event.target.is_in_group("ground"):
			print("Teleporting...")
			# get the player rig, which consists of the bee and all of its child nodes
			var bee_root = get_tree().get_current_scene().get_node("PlayerRig")
			# create a tween for smoother teleportation
			var teleport_tween = get_tree().create_tween()
			# perform tween on the player, animates the global_transform:origin property and setting the target value as where the pointer is clicked
			# animation lasts 2.1 seconds
			teleport_tween.tween_property(bee_root,"global_transform:origin",event.position,2.1)
			# SINE transition type, wave like effect
			teleport_tween.set_trans(Tween.TRANS_SINE)
			# teleportation starts slowly, finishes slowly and is a bit quicker in the middle
			teleport_tween.set_ease(Tween.EASE_IN_OUT)
			print("Teleported to:", bee_root.global_transform.origin)
		#  if target is the monument	
		if not triggered and event.target and event.target.is_in_group("monument"):
			while event.target:
				if event.target.has_method("_monument_click"):
					event.target._monument_click()
					print("calling _monument_click on: ", event.target.name)
					break
					# assign the target of the parent node as the target
				event.target = event.target.get_parent()

		# target is the sign
		if not triggered and event.target and event.target.is_in_group("sign"):
			while event.target:
				if event.target.has_method("_sign_click"):
					event.target._sign_click()
					print("calling _sign_click on: ", event.target.name)
					break
				event.target = event.target.get_parent()
