class_name Player
extends CharacterBody2D

@export var speed: int
var dragable_object: DragableArea = null
var pushable_object: PushableArea = null
const STINK = preload("res://scenes/stink.tscn")
@onready var player_state_machine = $PlayerStateMachine
var push_force = 2
@onready var camera_2d = $Camera2D

func _ready():
	player_state_machine.init(self)

func set_stinky(value: bool):
	if value:
		self.add_child(STINK.instantiate())
	else:
		for child in get_children():
			if child.name == "STINK":
				child.queue_free()
				
func _physics_process(delta):
	player_state_machine.process_physics()
	print(camera_2d.position)
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal() * push_force)
	
func normal_movement():
			# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	var zdirection = Input.get_axis("up", "down")
	if direction:
		rotation_degrees = 90 * direction
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		
	if zdirection:
		velocity.y = zdirection * speed
		rotation_degrees = 180 if zdirection == 1 else 0
	else:
		velocity.y = move_toward(velocity.y, 0, speed)

	move_and_slide()
