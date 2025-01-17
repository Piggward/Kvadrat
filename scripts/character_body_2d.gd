class_name Player
extends CharacterBody2D

@export var speed: int
var dragable_object: DragableArea = null
var dragable_offset: Vector2 = Vector2.ZERO

func _physics_process(delta):
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
		rotation_degrees = 180 if zdirection == 1 else 0
		velocity.y = zdirection * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)
		
	if Input.is_action_just_pressed("action") && dragable_object != null:
		dragable_object.drag(self)
			
	if Input.is_action_just_released("action") && dragable_object != null:
		dragable_object.stop_drag()

	move_and_slide()
