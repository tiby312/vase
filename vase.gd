extends RigidBody3D

var finished : bool = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	contact_monitor = true;
	max_contacts_reported = 2;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not finished:
		for node in get_colliding_bodies():
			if node.is_in_group("floor"):
				print("Hello!")
				# todo do something here
				finished = true;
				return;
		
