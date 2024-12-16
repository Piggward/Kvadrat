extends Area2D

@export var preAnimationTimeLine: String
@export var postAnimationTimeLine: String
@export var single_trigger: bool
@export var disable_player: bool
@export var animation: String
@export var delay: float
var triggered = false
@onready var animation_player = $"../AnimationPlayer"
var player_in_area: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body: CharacterBody2D):
	if triggered:
		return
	triggered = single_trigger
	if preAnimationTimeLine != "":
		play_timeline(load("res://" + preAnimationTimeLine + ".dtl"), body)
	if animation != "":
		animation_player.play(animation)
	await animation_player.animation_finished
	if postAnimationTimeLine != "":
		play_timeline(load("res://" + postAnimationTimeLine + ".dtl"), body)
	pass # Replace with function body.

func play_timeline(timeline, body):
	Dialogic.start(timeline)
	if disable_player:
		body.process_mode = Node.PROCESS_MODE_DISABLED
		Dialogic.timeline_ended.connect(func(): body.process_mode = Node.PROCESS_MODE_INHERIT)
	await Dialogic.timeline_ended
