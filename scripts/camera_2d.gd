extends Camera2D

@onready var player = $"../Player"
@onready var animation_player = $"../AnimationPlayer"

# Called when the node enters the scene tree for the first time.
func _ready():
	#animation_player.animation_started.connect(func(): self.process_mode = Node.PROCESS_MODE_DISABLED)
	#animation_player.animation_finished.connect(func(): self.process_mode = Node.PROCESS_MODE_INHERIT)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !animation_player.is_playing():
		self.global_position = player.global_position
	pass
