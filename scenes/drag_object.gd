class_name DragableBody
extends RigidBody2D

@onready var static_body_2d = $StaticBody2D
var offset: Vector2
var dragging = false
var player: Player

func drag(p: Player):
	offset = self.global_position - p.global_position
	static_body_2d.set_collision_layer_value(1, false)
	player = p
	dragging = true

func stop_drag():
	static_body_2d.set_collision_layer_value(1, true)
	dragging = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dragging:
		self.global_position = player.global_position + offset
	pass

func _on_body_entered(body):
	if body is Player: 
		body.dragable_object = self


func _on_body_exited(body):
	if body is Player: 
		body.dragable_object = null
