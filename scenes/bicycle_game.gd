extends Node2D
@onready var static_body_2d: StaticBody2D = $StaticBody2D
@onready var character_body_2d: CharacterBody2D = $CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	static_body_2d.global_position.y = character_body_2d.global_position.y
	pass
