extends Area3D

var target = null

func _ready() -> void:
	connect("area_entered",Callable(self,"_area_entered"))
	connect("area_exited",Callable(self,"_area_exited"))

func _area_entered(area):
	if area.name.begins_with("CrocusFlower"):
		target = area
		
func _area_exited(area):
	if target == area:
		target = null
		
func _input(event: InputEvent) -> void:
	if event is InputEventJoypadButton and event.pressed:
		if target and event.button_index == 6:
			target.call("_bee_click")
			
		
		
	
	
	
	
