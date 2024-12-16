class_name RoundPoly
extends Polygon2D

@export var round: bool
@export var random_color: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	if round:
		var nb_points = 25
		var pol = []
		for i in range(nb_points):
			var angle = lerp(-PI, PI, float(i)/nb_points)
			pol.push_back(Vector2(cos(angle), sin(angle)) * 10)
		self.polygon = pol
	if random_color:
		self.color = Color(randf_range(0, 1),randf_range(0, 1), randf_range(0, 1), randf_range(0, 1))
	pass # Replace with function body.

func _draw():
	#for i in polygon.size() - 1:
		#print(polygon.size() - 1)
		#draw_polyline([polygon[i-1], polygon[i]], Color.BLACK, 1)
	#draw_polyline([polygon[0], polygon[polygon.size() - 1]], Color.BLACK, 0.5)
	for i in range(polygon.size()):
		draw_polyline([polygon[i], polygon[(i + 1) % polygon.size()]], Color.BLACK, 1)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
