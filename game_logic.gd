extends Node3D

@onready var en = get_node("../Enemy") as Enemy

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	if not en.is_node_ready():
		await en.ready
		
	var j=en.duplicate(DUPLICATE_DEFAULT | DUPLICATE_INTERNAL_STATE)
	add_child(j)
	
	if not j.is_node_ready():
		await j.ready
	
	
	var second:Enemy=j as Enemy
	second.position=en.position
	second.new_pos()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(en)
	pass
