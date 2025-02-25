extends Area2D

var player_in_area: bool
signal player_in_area_changed(value: bool)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	player_in_area = true
	player_in_area_changed.emit(true)
	pass # Replace with function body.


func _on_body_exited(body):
	player_in_area = false
	player_in_area_changed.emit(false)
	pass # Replace with function body.
