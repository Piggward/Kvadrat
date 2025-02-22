extends Node2D
const ITEM_RECEIVED = preload("res://scenes/item_received.tscn")
@onready var canvas_layer = $CanvasLayer
@onready var animation_player: AnimationPlayer = $Events/AnimationPlayer
@onready var edges = $CanvasLayer/Control/Edges
@onready var marker_2d = $Player/Camera2D/Marker2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.signal_event.connect(on_dialogic_signal)
	pass # Replace with function body.

func on_dialogic_signal(m: String):
	match m:
		"reward":
			var item = ITEM_RECEIVED.instantiate()
			canvas_layer.add_child(item)
			await get_tree().create_timer(2).timeout
			item.queue_free()
		"campfire_finish":
			animation_player.play_backwards("campfire_view")
		"edges_given":
			edges.reparent(self)
			edges.global_position = marker_2d.global_position
			animation_player.play("meld_square")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
