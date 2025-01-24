extends Node2D
@onready var static_body_2d: StaticBody2D = $StaticBody2D
@onready var character_body_2d: CharacterBody2D = $CharacterBody2D
@onready var obstacle_spawn = $ObstacleSpawn
var ospawn_offset: float
var camera_offset: float
@onready var camera_2d = $Camera2D
@export var distance_to_level: int
var current_level = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ospawn_offset = character_body_2d.position.y - obstacle_spawn.position.y
	camera_offset = character_body_2d.position.y - camera_2d.position.y
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	static_body_2d.global_position.y = character_body_2d.global_position.y
	obstacle_spawn.global_position.y = character_body_2d.global_position.y - ospawn_offset
	camera_2d.global_position.y = character_body_2d.global_position.y - camera_offset
	if (character_body_2d.position.y <= (distance_to_level * current_level) * -1):
		current_level += 1
		print(current_level)
