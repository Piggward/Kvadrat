extends Node2D
@onready var static_body_2d: StaticBody2D = $StaticBody2D
@onready var player: CharacterBody2D = $CharacterBody2D
@onready var obstacle_spawn = $ObstacleSpawn
var ospawn_offset: float
var camera_offset: float
@onready var camera_2d = $Camera2D
@export var distance_to_level: int
@export var distance_to_obstacle: int
var current_level = 1
var next_spawn = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ospawn_offset = player.position.y - obstacle_spawn.position.y
	camera_offset = player.position.y - camera_2d.position.y
	next_spawn = player.position.y - distance_to_obstacle
	obstacle_spawn.amount = 1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	static_body_2d.global_position.y = player.global_position.y
	obstacle_spawn.global_position.y = player.global_position.y - ospawn_offset
	camera_2d.global_position.y = player.global_position.y - camera_offset
	if (player.position.y <= (distance_to_level * current_level) * -1):
		current_level += 1
		print(current_level)
		
	if player.position.y <= next_spawn:
		obstacle_spawn.spawn_obstacle(Vector2(current_level, 1))
		next_spawn = player.position.y - distance_to_obstacle
	
