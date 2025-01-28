extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(10).timeout
	self.queue_free()
	pass # Replace with function body.




func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.set_penalty()
