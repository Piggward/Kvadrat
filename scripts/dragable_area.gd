class_name DragableArea
extends Area2D

var offset: Vector2
var dragging = false
var player: Player
var object: RigidBody2D
const MIN_VELOCITY = -150
const MAX_VELOCITY = 150

func drag(p: Player):
	offset = self.global_position - p.global_position
	player = p
	dragging = true
	object.set_collision_mask_value(2, false)
	player.set_collision_mask_value(5, false)

func stop_drag():
	dragging = false
	object.linear_velocity = Vector2.ZERO
	object.angular_velocity = 0
	player.set_collision_mask_value(5, true)
	object.set_collision_mask_value(2, true)

# Called when the node enters the scene tree for the first time.
func _ready():
	object = get_parent()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dragging:
		object.linear_velocity = Vector2(clamp(player.velocity.x, MIN_VELOCITY, MAX_VELOCITY), clamp(player.velocity.y, MIN_VELOCITY, MAX_VELOCITY))
	pass


func _on_body_entered(body):
	if body is Player: 
		body.dragable_object = self


func _on_body_exited(body):
	if body is Player and dragging: 
		player.dragable_object = null
		stop_drag()
