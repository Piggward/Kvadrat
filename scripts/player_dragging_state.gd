extends PlayerState

# Called when the node enters the scene tree for the first time.
func enter():
	player.dragable_object.drag(player)
	
func exit():
	player.dragable_object.stop_drag()
	
func process_physics():
	if player.dragable_object == null || Input.is_action_just_released("action"):
		transition_requested.emit(self, PlayerState.State.BASE)
		
	player.normal_movement()
		
	
