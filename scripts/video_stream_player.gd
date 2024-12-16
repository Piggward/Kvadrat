extends VideoStreamPlayer

@onready var player = $"../Player" 

func _ready():
	print(ResourceLoader.exists("res://video3.ogg.import"))
	#self.stream.file = "res://video3.ogg.import"
	#self.play()
	pass
	#var player_position = Vector2(100, 100)
	#var sound_source_position = Vector2(500, 500)
	#
	## Calculate the distance
	#var distance = player_position.distance_to(sound_source_position)
	#
	## Calculate volume based on distance
	#var vol = calculate_volume(distance)
	#
	#print("Distance:", distance, "Volume:", volume)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	volume = calculate_volume(self.global_position.distance_to(player.global_position))
	pass
	
func calculate_volume(distance: float, max_distance: float = 200.0, min_distance: float = 5.0) -> float:
	# Clamp the distance to the range [min_distance, max_distance]
	distance = clamp(distance, min_distance, max_distance)
	
	# Normalize and invert the distance to calculate volume
	return 1.0 - (distance - min_distance) / (max_distance - min_distance)
