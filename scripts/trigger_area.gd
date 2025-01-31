extends Area2D

@export var preAnimationTimeLine: String
@export var postAnimationTimeLine: String
@export var single_trigger: bool
@export var disable_player: bool
@export var animation: String
@export var delay: float
var triggered = false
@onready var animation_player = $"../AnimationPlayer"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body: Node2D):
	if triggered:
		return
	if delay > 0:
		await get_tree().create_timer(delay).timeout
	triggered = single_trigger
	if disable_player:
		body.process_mode = Node.PROCESS_MODE_DISABLED
	if preAnimationTimeLine != "":
		await play_timeline(load("res://dialogic/timelines/" + preAnimationTimeLine + ".dtl"), body)
	if animation != "":
		animation_player.play(animation)
	await animation_player.animation_finished
	if postAnimationTimeLine != "":
		await play_timeline(load("res://dialogic/timelines/" + postAnimationTimeLine + ".dtl"), body)
		
	body.process_mode = Node.PROCESS_MODE_INHERIT
	pass # Replace with function body.

func play_timeline(timeline, body):
	Dialogic.start(timeline)
	if disable_player:
		body.process_mode = Node.PROCESS_MODE_DISABLED
		await Dialogic.timeline_ended
		body.process_mode = Node.PROCESS_MODE_INHERIT
		
func tweenit(object: PhysicsBody2D, new_pos: Vector2, speed: float, property: String):
	var tween = create_tween().set_parallel(true)
	tween.tween_property(object, property, new_pos, speed)
