extends Area2D

const TIMELINE = preload("res://dialogic/timelines/note.dtl")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body: CharacterBody2D):
	Dialogic.start(TIMELINE)
	pass # Replace with function body.

func _on_body_exited(body):
	Dialogic.end_timeline()
	pass # Replace with function body.
