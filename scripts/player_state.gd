class_name PlayerState
extends Node

enum State {BASE, DRAGGING, PUSHING};

signal transition_requested(from: PlayerState, to: State)

@export var state: State

var player: Player

func enter() -> void:
	pass

func exit() -> void:
	pass
	
func process_physics() -> void:
	pass
