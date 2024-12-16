class_name CutsceneManager
extends Node

var cutscenes: Array[Cutscene]
signal start_cutscene(name: String)

# Called when the node enters the scene tree for the first time.
func _ready():
	start_cutscene.connect(start)
	for child: Cutscene in get_children():
		cutscenes.append(child)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func start(n: String):
	var player = get_tree().get_first_node_in_group("player")
	player.process_mode = Node.PROCESS_MODE_DISABLED
	var cutscene = cutscenes.filter(func(c): return c.name == n)[0]
	cutscene.cutscene_ended.connect(end)
	cutscene.cutscene_ended.connect(func(): cutscene.cutscene_ended.disconnect)
	cutscene.start_cutscene()

func end():
	var player = get_tree().get_first_node_in_group("player")
	player.process_mode = Node.PROCESS_MODE_INHERIT
