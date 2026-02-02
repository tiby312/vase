extends XROrigin3D



var player_height;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Ensure the XROrigin3D has a child node that is an XRCamera3D
	# The camera node is usually automatically added or you add it manually
	var camera = find_child("XRCamera3D") # Replace "XRCamera3D" if you named it differently
	if camera:
		# Get the camera's position in the parent's local space (the XROrigin3D's space)
		# The y-coordinate is the height above the origin's floor
		player_height = camera.transform.origin.y
		print("Player starting physical height: ", player_height, " meters")
	else:
		print("XRCamera3D node not found!")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var camera = find_child("XRCamera3D") # Replace "XRCamera3D" if you named it differently
	
	var h=camera.transform.origin.y;
	if player_height!=h:
		print("Next height=",h)
		player_height=h
	
	pass
