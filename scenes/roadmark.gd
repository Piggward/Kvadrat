extends Sprite2D
@onready var end = $"../../StaticBody2D/End"
@onready var start = $"../../StaticBody2D/Start"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.global_position.y >= end.global_position.y:
		self.global_position.y = start.global_position.y
	pass
