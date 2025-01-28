extends Area2D

const COLLISION_OBJECT = preload("res://scenes/collision_object.tscn")
var size:int
var offset: float
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var player: CharacterBody2D = $"../Player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	size = self.collision_shape_2d.get_shape().get_rect().size.x / 2
	offset = player.position.y - self.position.y
	pass # Replace with function body.

func spawn_obstacle(scale: int, speed: Vector2, amount: int):
	for i in clamp(amount, amount, 5):
		var rigid = RigidBody2D.new()
		rigid.linear_velocity = speed
		rigid.gravity_scale = 0
		var obs = COLLISION_OBJECT.instantiate()
		var rand_pos = -1 if randi_range(0, 1) == 0 else 1 
		var random_x = randi_range(0, size)
		var ex = random_x * rand_pos
		obs.global_position = Vector2(self.global_position.x + ex, self.global_position.y)
		obs.scale = Vector2(scale, 1)
		rigid.add_child(obs)
		get_parent().add_child(rigid)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.y = player.global_position.y - offset
	pass
