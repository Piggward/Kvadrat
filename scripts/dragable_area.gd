class_name DragableArea
extends Area2D

var offset: Vector2
var dragging = false
var player: Player
var object: RigidBody2D
var offset_rotation: int

func drag(p: Player):
	offset = self.global_position - p.global_position
	player = p
	dragging = true

func stop_drag():
	dragging = false
	player.dragable_object = null
	object.linear_velocity = Vector2.ZERO
	self.global_position = object.global_position
	self.rotation = object.rotation - offset_rotation

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is RigidBody2D:
			object = child
			offset_rotation = child.rotation
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dragging:
		object.linear_velocity = player.velocity
		self.global_position = object.global_position
		self.rotation = object.rotation - offset_rotation
	pass


func _on_body_entered(body):
	if body is Player: 
		body.dragable_object = self


func _on_body_exited(body):
	if body is Player: 
		stop_drag()
