extends Node2D

signal cutscene_start
signal cutscene_end

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func start_cutscene():
	cutscene_start.emit()
	
func end_cutscene():
	cutscene_end.emit()
	
func start_dialogic(timeLine: String):
	Dialogic.start("res://dialogic/timelines/" + timeLine + ".dtl")
