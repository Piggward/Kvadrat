extends AnimationPlayer

signal cutscene_event(message: String)

# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.signal_event.connect(dialogic)
	pass # Replace with function body.

func dialogic(s):
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func create_event(message: String):
	cutscene_event.emit(message)
