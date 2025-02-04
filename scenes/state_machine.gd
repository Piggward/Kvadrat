class_name PlayerStateMachine
extends Node

@export var initial_state: PlayerState

var current_state: PlayerState
var states := {};

func init(player: Player) -> void:
	for child in get_children(): 
		if child is PlayerState: 
			states[child.state] = child;
			child.transition_requested.connect(_on_transition_requested)
			child.player = player
			
	if initial_state:
		initial_state.enter()
		current_state = initial_state
		
func process_physics():
	current_state.process_physics()
		
func _on_transition_requested(from: PlayerState, to: PlayerState.State) -> void:
	if from != current_state:
		return
	
	var new_state: PlayerState = states[to]
	if not new_state:
		return
	
	if current_state:
		current_state.exit()
	
	print("enter state ", to)
	new_state.enter()
	current_state = new_state
