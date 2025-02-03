extends PointLight2D


# Called when the node enters the scene tree for the first time.
func _ready():
	flicker()
	pass # Replace with function body.

func flicker():
	var r = randf_range(0.8, 1.2)
	self.energy = r
	var wait = randf_range(0.2, 0.5)
	await get_tree().create_timer(wait).timeout
	flicker()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
