extends XRController3D

var target: Area3D = null

func _ready() -> void:
	connect("area_entered",Callable(self,"_area_entered"))
	connect("area_exited",Callable(self,"_area_exited"))

func _area_entered(area_of_garden):
	if area_of_garden.is_in_group("flower"):
		target = area_of_garden
	elif area_of_garden.is_in_group("monument"):
		target = area_of_garden
		
func _area_exited(area_of_garden):
	if target == area_of_garden:
		target = null
		
func _input(event: InputEvent) -> void:
	if event is InputEventJoypadButton and event.pressed:
		if target and event.button_index == 7:
			if target.is_in_group("flower"):
				target.call("_bee_click")
			elif target.is_in_group("monument"):
				target.call("_monument_click")
			
		
		
	
	
