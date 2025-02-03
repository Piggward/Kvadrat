extends AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready():
	play_sound()
	pass # Replace with function body.

func play_sound():
	play()
	var wait_time = randf_range(1, 3.5)
	await get_tree().create_timer(wait_time).timeout
	play_sound()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
