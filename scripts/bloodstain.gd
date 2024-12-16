extends Polygon2D

var current_radius = 2.0
var speed = 2.0
@onready var animation_player = $"../AnimationPlayer"

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.animation_started.connect(func(s): if s == "dead_wife_scene": process_mode = Node.PROCESS_MODE_INHERIT)
	#rounda(current_radius)
	self.process_mode = Node.PROCESS_MODE_DISABLED
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.scale.x += 0.1 * delta
	self.scale.y += 0.1 * delta
	#rounda(current_radius)
	if scale.x >= 3:
		self.process_mode = Node.PROCESS_MODE_DISABLED
	#pass
	
func rounda(radius: float):
	var nb_points = 25
	var pol = []
	for i in range(nb_points):
		var angle = lerp(-PI, PI, float(i)/nb_points)
		pol.push_back(Vector2(cos(angle), sin(angle)) * radius)
	self.polygon = pol
