class_name Enemy
extends RigidBody3D


@onready var area3d = get_node("Area3D")


@onready var coll = get_node("CollisionShape3D")

@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area3d.body_entered.connect(_on_body_entered)
	timer.wait_time = 3.0
	timer.one_shot = false
	timer.timeout.connect(_on_timer_timeout)
	timer.start()
	
	pass # Replace with function body.

func _on_timer_timeout():
	var dir=randf_range(-PI,PI)
	var x=cos(dir)
	var y=sin(dir)
	
	var dir_to_origin=Vector3(0.0,0.0,0.0)-position;
	dir_to_origin=dir_to_origin.normalized()
	dir_to_origin.y=0
	apply_force(((dir_to_origin+Vector3(x,0.0,y))/2)*50)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func new_pos():
	var rad=randf_range(0,2*PI)
	position.x=cos(rad)*5
	position.z=sin(rad)*5
	

func _on_body_entered(body: Node3D)->void:
	if body.name=="Vase":
		print("Detected!!!!");
		new_pos()
	pass
