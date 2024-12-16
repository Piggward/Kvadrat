extends PointLight2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.energy -= 0.5 * delta
	if energy <= 0:
		self.queue_free()
	pass
