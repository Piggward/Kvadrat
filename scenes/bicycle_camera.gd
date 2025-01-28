extends Camera2D
var camera_offset: float
@onready var player: CharacterBody2D = $"../Player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	camera_offset = player.position.y - self.position.y
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.y = player.global_position.y - camera_offset
	pass
