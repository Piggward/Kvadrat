class_name PushableArea
extends Area2D

var object: RigidBody2D = null

# Called when the node enters the scene tree for the first time.
func _ready():
	object = get_parent()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func push(force: Vector2):
	object.apply_central_force(force)


func _on_body_entered(body):
	if body is Player:
		body.pushable_object = self
	pass # Replace with function body.


func _on_body_exited(body):
	if body is Player:
		body.pushable_object = null
	pass # Replace with function body.
