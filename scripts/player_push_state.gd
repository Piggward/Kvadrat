extends PlayerState

const PUSH_FORCE = 10000
var ARROW_DISTANCE = Vector2(15, 0)
const ARROW = preload("res://scenes/arrow.tscn")

var arrow_node: Node2D
var arrow: Polygon2D
var speed_save: int

func enter() -> void:
	player.pushable_object.object.angular_velocity = 0
	player.pushable_object.object.linear_velocity = Vector2.ZERO
	arrow = ARROW.instantiate()
	arrow_node = Node2D.new()
	arrow_node.position = Vector2.ZERO
	arrow_node.add_child(arrow)
	player.add_child(arrow_node)
	pass

func exit() -> void:
	arrow.queue_free()
	arrow_node.queue_free()
	pass
	
func process_physics():
	aim()
	if Input.is_action_just_released("action"):
		push()
		transition_requested.emit(self, PlayerState.State.BASE)
		
	if player.pushable_object == null:
		transition_requested.emit(self, PlayerState.State.BASE)
		
func aim():
	var direction = Input.get_axis("left", "right")
	var zdirection = Input.get_axis("up", "down")
	print(direction)
	print(zdirection)
	
	var rot = 0
	if (direction and zdirection):
		rot = (90 * direction) + ((45 * zdirection) * direction)
	elif (direction):
		rot = (90 * direction)
	elif zdirection:
		rot = 90 * (zdirection + 1) 
	else:
		return
		
	arrow_node.rotation_degrees = rot - player.rotation_degrees
	var position_ratio = 20 if direction and zdirection else 15
	arrow_node.position = Vector2(0, -position_ratio).rotated(deg_to_rad((arrow_node.rotation_degrees)))
	
func push():
	var direction = Input.get_axis("left", "right")
	var zdirection = Input.get_axis("up", "down")
	
	var x = direction * PUSH_FORCE
	var y = zdirection * PUSH_FORCE
	
	if player.pushable_object:
		player.pushable_object.push(Vector2(x, y))
