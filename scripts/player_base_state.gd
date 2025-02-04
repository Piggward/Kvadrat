extends PlayerState

func enter() -> void:
	pass

func exit() -> void:
	pass

func process_physics():
	check_for_transition()
	player.normal_movement()
	
func check_for_transition():
	if Input.is_action_just_pressed("action") && player.dragable_object != null:
		transition_requested.emit(self, State.DRAGGING)
		
	if Input.is_action_just_pressed("action") && player.pushable_object != null:
		transition_requested.emit(self, State.PUSHING)
