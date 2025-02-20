extends Node2D

@onready var animation_player = $AnimationPlayer
@onready var spawnArea = $FishBeltItems/SpawnArea
@onready var despawnArea = $FishBeltItems/DespawnArea
@onready var zoom_spawn_area = $FishBeltItems/ZoomSpawnArea
@onready var zoom_despawn_area = $FishBeltItems/ZoomDespawnArea
@onready var belt_area = $FishBeltItems/BeltArea
@onready var audio_stream_player = $AudioStreamPlayer
@onready var cutscenes = $Cutscenes
@onready var player = $Player
@onready var camera_2d = $Player/Camera2D
@onready var guard_6 = $Npcs/Guard6
@onready var fish_box = $FishBox
@onready var fish_storage = $FishStorage
const TRANSITION_AREA = preload("res://scenes/transition_area.tscn")
@onready var fish_minigame_marker = $FishMinigameMarker

# Called when the node enters the scene tree for the first time.
func _ready():
	play_fish_minigame()
	await get_tree().create_timer(0.5).timeout
	start_game()
	Dialogic.signal_event.connect(on_dialogic_signal)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(player.position)
	pass
	
func start_game():
	audio_stream_player.get_stream_playback().switch_to_clip_by_name("Fishmusic")
	zoom_despawn_area.queue_free()
	zoom_spawn_area.queue_free()
	cutscenes.start_cutscene.emit("ReturnToGameAndGJEnter")
	#spawnArea.process_mode = Node.PROCESS_MODE_INHERIT
	#despawnArea.process_mode = Node.PROCESS_MODE_INHERIT
	spawnArea.visible = true
	despawnArea.visible = true
	belt_area.populateBelt()
	for fish: Fish in get_tree().get_nodes_in_group("fish"):
		fish.stop_minigame()
		
		
func start_dialogic(timeLine: String):
	Dialogic.start("res://dialogic/timelines/factory/" + timeLine + ".dtl")
	
func on_dialogic_signal(m: String):
	match m:
		"general_jimmy_entrance_finish":
			animation_player.play("general_jimmy_back_to_office")
		"end_scene":
			print("ending scene")
			var x = TRANSITION_AREA.instantiate()
			x.trigger_asap = true
			x.file_name = ("res://scenes/bicycle_game.tscn")
			self.add_child(x)
			
func play_fish_minigame():
	player.position = fish_minigame_marker.position
	camera_2d.position = Vector2(0, -31)
	camera_2d.zoom = Vector2(17, 17)
	
func init_prank_animation(original_pos: Vector2, original_rot: float):
	var tween = create_tween().set_parallel(true)
	var diff = player.global_position - guard_6.global_position
	var new_pos_x = (guard_6.position + diff).x
	tween.tween_property(guard_6, "position", Vector2(new_pos_x, guard_6.position.y), 0.4)
	tween.tween_property(guard_6, "rotation", guard_6.rotation + deg_to_rad(90), 0.4)
	await tween.finished
	var tween2 = create_tween().set_parallel(true)
	tween2.tween_property(guard_6, "position", Vector2(guard_6.position.x, guard_6.position.y - 20), 0.2)
	tween2.tween_property(player, "position", Vector2(player.position.x, player.position.y - 40), 0.4)
	tween2.tween_property(fish_box, "position", Vector2(fish_box.position.x, fish_storage.position.y), 0.4)
	start_dialogic("guard_prank")
	await tween2.finished
	fish_box.queue_free()
	Dialogic.timeline_ended.connect(func(): player.set_stinky(true))
