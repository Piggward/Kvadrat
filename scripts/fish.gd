class_name Fish
extends Area2D

const DEADFISH = preload("res://art/deadfish.png")
const LIVEFISH = preload("res://art/livefish.png")
@onready var sprite_2d = $Sprite2D
@export var live: bool
var minigame_playing = true

# Called when the node enters the scene tree for the first time.
func _ready():
	if live:
		sprite_2d.texture = LIVEFISH
	else:
		sprite_2d.texture = DEADFISH
		sprite_2d.scale.y *= -1
		if !minigame_playing:
			stop_minigame()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position.x -= 16 * delta
	pass
	
func stop_minigame():
	if !live:
		await get_tree().create_timer(randf_range(1, 40)).timeout
		self.queue_free()


func _on_control_gui_input(event: InputEvent):
	if event.is_action_pressed("mleft"):
		self.queue_free()
	pass # Replace with function body.
