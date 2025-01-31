class_name TransitionArea
extends Area2D

@onready var sprite_2d = $Sprite2D
@onready var animation_player = $AnimationPlayer
@export var file_name: String
@export var trigger_asap: bool
@export var track_position: bool
@export var object: PhysicsBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if trigger_asap:
		transition(file_name)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if track_position:
		self.global_position = object.global_position
	pass

func transition(fn):
	animation_player.play("fade_out")
	await animation_player.animation_finished
	await get_tree().create_timer(0.5).timeout
	track_position = false
	get_tree().change_scene_to_file(file_name)
	
func _on_body_entered(body):
	if body is Player:
		transition(file_name)
	pass # Replace with function body.
