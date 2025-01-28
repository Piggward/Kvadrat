extends Node2D
@onready var static_body_2d: StaticBody2D = $StaticBody2D
@onready var player: CharacterBody2D = $Player
@onready var obstacle_spawn = $ObstacleSpawn
@onready var camera_2d = $Camera2D
@export var distance_to_level: int
@export var distance_to_obstacle: int
var current_level = 1
const MAX_LEVEL = 10
var next_spawn = 0
var current_amount = 1
var current_speed = 0.33
var current_size = 1
const OBSTACLE_MAX_VELOCITY = 200
const OBSTACLE_MIN_VELOCITY = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	next_spawn = player.position.y - distance_to_obstacle
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (player.position.y <= (distance_to_level * current_level) * -1):
		level_up()
		
	if player.position.y <= next_spawn:
		obstacle_spawn.spawn_obstacle(current_size, Vector2(0, OBSTACLE_MAX_VELOCITY * current_speed), current_amount)
		next_spawn = player.position.y - distance_to_obstacle
		
func level_up():
	current_level += 1
	if current_level % 3 == 0:
		speed_up()
	elif current_level % 2 == 0:
		amount_up()
	else:
		size_up()
		
		
func speed_up():
	current_speed += 0.33
	print("speed up!")
	
func size_up():
	current_size += 1
	print("size up!")
	
	
func amount_up():
	current_amount += 1
	print("amount up!")
	
	
