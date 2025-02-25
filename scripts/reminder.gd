extends Control

@onready var animation_player = $"../AnimationPlayer"
@onready var bicycle_lane = $"../BicycleLane"

# Called when the node enters the scene tree for the first time.
func _ready():
	bicycle_lane.player_in_area_changed.connect(meth)
	pass # Replace with function body.

func meth(value):
	if not value:
		animation_player.play("player_left_area")
	else:
		animation_player.stop()
		self.visible = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
