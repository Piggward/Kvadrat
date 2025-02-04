extends PlayerState

const PUSH_FORCE = 10000

func enter() -> void:
	player.pushable_object.object.angular_velocity = 0
	player.pushable_object.object.linear_velocity = Vector2.ZERO
	pass

func exit() -> void:
	pass
	
func process_physics():
	if Input.is_action_just_released("action"):
		push()
		transition_requested.emit(self, PlayerState.State.BASE)
		
	if player.pushable_object == null:
		transition_requested.emit(self, PlayerState.State.BASE)
	
func push():
	var direction = Input.get_axis("left", "right")
	var zdirection = Input.get_axis("up", "down")
	
	var x = direction * PUSH_FORCE
	var y = zdirection * PUSH_FORCE
	
	if player.pushable_object:
		player.pushable_object.push(Vector2(x, y))
