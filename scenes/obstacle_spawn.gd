extends Area2D

const COLLISION_OBJECT = preload("res://scenes/collision_object.tscn")
var size:int
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	size = self.collision_shape_2d.get_shape().get_rect().size.x / 2
	spawn_obstacle()
	pass # Replace with function body.

func spawn_obstacle():
	var obs = COLLISION_OBJECT.instantiate()
	var rand_pos = -1 if randi_range(0, 1) == 0 else 1 
	var random_x = randi_range(0, size)
	var ex = random_x * rand_pos
	obs.global_position = Vector2(self.global_position.x + ex, self.global_position.y)
	get_parent().get_parent().add_child(obs)
	await get_tree().create_timer(1).timeout
	spawn_obstacle()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
