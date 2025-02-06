extends RigidBody2D

@export var max_speed: int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func stop():
	linear_velocity = Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass
