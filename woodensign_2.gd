extends Area3D

var wooden_sign_label: Label3D

func _ready() -> void:
	wooden_sign_label = get_node("fun_fact_label")
	wooden_sign_label.visible = false

func _sign_click():
	print("sign clicked")
	if not wooden_sign_label.visible:
		wooden_sign_label.visible = true
		wooden_sign_label.text = "Fun Fact: over 35% of food crops, such as fruit and vegetables rely on pollinators"
		
	
