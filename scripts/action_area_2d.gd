extends Area2D

var player_in_area: bool
@export var timeLine: String
var cd = false
# Called when the node enters the scene tree for the first time.
func _ready():
	player_in_area = false
	#process_mode = PROCESS_MODE_DISABLED
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_in_area && Input.is_action_just_pressed("action") && Dialogic.current_timeline == null && !cd:
		Dialogic.start(load("res://dialogic/timelines/" + timeLine + ".dtl"))
		cd = true
		await Dialogic.timeline_ended
		await get_tree().create_timer(0.2).timeout
		cd = false 
	pass


func _on_body_entered(body):
	if body is Player:
		player_in_area = true
	pass # Replace with function body.


func _on_body_exited(body):
	if body is Player:
		player_in_area = false
		if Dialogic.current_timeline and Dialogic.current_timeline.as_text() == timeLine:
			Dialogic.end_timeline()
	pass # Replace with function body.
