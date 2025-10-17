extends CharacterBody3D
@onready var XRC := $"../XRCamera3D"


func _process(delta):
	if(XRC):
		global_transform.origin = XRC.global_transform.origin
			
