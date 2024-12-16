class_name Cutscene
extends Node

@export var cutscene_trigger: String
@export var animation_player: AnimationPlayer
@export var animations: Array[CutsceneEvent]
@export var dialogues: Array[CutsceneEvent]
@export var timeline_path: String
@export var start_with_animation: bool

signal cutscene_ended

# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.signal_event.connect(check_trigger)
	animation_player.cutscene_event.connect(check_trigger)
	pass # Replace with function body.

func start_cutscene():
	if start_with_animation:
		animation_player.play(animations[0].event_name)
	else:
		Dialogic.start(timeline_path + dialogues[0].event_name + ".dtl")
	
func check_trigger(m: String):
	var a = animations.filter(func(a): return a.trigger == m)
	var d = dialogues.filter(func(a): return a.trigger == m)
	if a.size() > 0:
		animation_player.play(a[0].event_name)
		if a[0].last_event:
			animation_player.animation_finished.connect(func(n): cutscene_ended.emit())
			animation_player.animation_finished
	if d.size() > 0:
		Dialogic.start(timeline_path + d[0].event_name + ".dtl")
		if d[0].last_event:
			Dialogic.timeline_ended.connect(func(): cutscene_ended.emit())
			
func end(anim_name: String):
	cutscene_ended.emit()
