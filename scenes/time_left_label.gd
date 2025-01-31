class_name TimerLabel
extends Label

var time: float
var int_time: int
var counting = false

signal times_up

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func set_timer(t):
	print(t)
	time = t
	int_time = int(t)
	counting = true
	set_time_text()
	
func set_time_text():
	text = "Time left: " + str(int_time) + " seconds!"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if counting:
		time -= delta
		var it = int(time)
		if it != int_time:
			int_time = it
			set_time_text()
	pass
