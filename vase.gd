extends RigidBody3D

var initial_position: Vector3
var initial_transform:Basis;
var finished : bool = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initial_position = self.global_position;
	contact_monitor = true;
	max_contacts_reported = 2;
	initial_transform=self.transform.basis;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if not finished:
		for node in get_colliding_bodies():
			if node.is_in_group("floor"):
				self.global_position=initial_position;
				
				self.linear_velocity=Vector3.ZERO;
				self.angular_velocity=Vector3.ZERO;
				self.transform.basis=initial_transform;
				#finished = true;
				return;
		
