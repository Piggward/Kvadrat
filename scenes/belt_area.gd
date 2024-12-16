class_name BeltArea
extends Area2D

const LIVEFISH = preload("res://scenes/livefish.tscn")
@onready var collision_shape_2d = $CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func populateBelt():
	for i in 50:
		var f = LIVEFISH.instantiate()
		f.live = true if randi_range(1, 10) > 4 else false
		add_child(f)
		f.global_position = rpos()
		print(f.global_position)
		
func rpos():
	var s = randf_range(0, collision_shape_2d.shape.get_rect().size.y / 2)
	var y = -1 if randi_range(0, 1) == 0 else 1 
	var s2 = randf_range(0, collision_shape_2d.shape.get_rect().size.x / 2)
	var y2 = -1 if randi_range(0, 1) == 0 else 1 
	return Vector2(s2 * y2,  s * y) + self.global_position
