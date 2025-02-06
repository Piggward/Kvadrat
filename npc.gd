class_name Npc
extends Area2D

@onready var collision_shape_2d = $CollisionShape2D
@export var round: bool
@export var random_color: bool
@onready var poly = $Polygon2D
@export var color: Color
@export var radius: int
@onready var static_body_2d = $StaticBody2D
@export var has_dialogue: bool
@export var dialogue_name: String
const ACTION_AREA_2D = preload("res://scenes/action_area_2d.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	if round:
		var nb_points = 150
		var pol = []
		for i in range(nb_points):
			var angle = lerp(-PI, PI, float(i)/nb_points)
			pol.push_back(Vector2(cos(angle), sin(angle)) * radius)
		poly.polygon = pol
		var col = CollisionPolygon2D.new()
		col.polygon = pol
		static_body_2d.add_child(col)
	var rc = Color(randf_range(0, 1),randf_range(0, 1), randf_range(0, 1), randf_range(0, 1))
	for child in get_children():
		if child is Polygon2D and not child.name == "Gun":
			child.color = rc if random_color else color
	
	if has_dialogue:
		print("has dialogue")
		var dialogue = ACTION_AREA_2D.instantiate()
		dialogue.timeLine = dialogue_name
		var collision = CollisionShape2D.new()
		var shape = collision_shape_2d.shape.duplicate()
		shape.size *= Vector2(3, 3)
		collision.shape = shape.duplicate()
		dialogue.add_child(collision)
		add_child(dialogue)
	pass # Replace with function body.

func _draw():
	#for i in polygon.size() - 1:
		#print(polygon.size() - 1)
		#draw_polyline([polygon[i-1], polygon[i]], Color.BLACK, 1)
	#draw_polyline([polygon[0], polygon[polygon.size() - 1]], Color.BLACK, 0.5)
	if not round:
		for i in range(poly.polygon.size()):
			draw_polyline([poly.polygon[i], poly.polygon[(i + 1) % poly.polygon.size()]], Color.BLACK, 1)
	else:
		draw_circle(Vector2.ZERO, radius + 0.5, Color.BLACK, false, 1)
		
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
