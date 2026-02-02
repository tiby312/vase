extends Node3D


@onready var area3d = get_node("Area3D")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area3d.body_entered.connect(_on_body_entered)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node3D)->void:
	if body.name=="Vase":
		print("Detected!!!!");
		position.x=randf_range(-2,2)
		position.z=randf_range(-2,2)
	
	pass
