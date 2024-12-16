extends Area2D

const LIVEFISH = preload("res://scenes/livefish.tscn")
@onready var collision_shape_2d = $CollisionShape2D
var cd = false
var min_spawntime = 0.1
var max_spawntime = 0.7
@export var minigame: bool
# Called when the node enters the scene tree for the first time.
func _ready():
	rheight()
	start_increasing()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if cd:
		return
	var fish = LIVEFISH.instantiate()
	fish.live = true if randi_range(1, 10) > 4 else false
	fish.minigame_playing = minigame
	add_child(fish)
	fish.global_position = Vector2(self.position.x, self.position.y + rheight())
	#fish.global_position = Vector2(954, 352)
	cd = true
	await get_tree().create_timer(randf_range(min_spawntime, max_spawntime)).timeout
	cd = false
	

func rheight():
	var s = collision_shape_2d.shape.get_rect().size.y / 2
	var y = -1 if randi_range(0, 1) == 0 else 1 
	return randf_range(0,  s * y)

func start_increasing():
	await get_tree().create_timer(5).timeout
	
	
