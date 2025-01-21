extends CharacterBody2D


const MAXSPEED = 300.0
const PEDALSPEED = 3
const MIN_PEDAL_TIME = 0.4

var nextPedal = null
var currentPedalTime = 0
var accelTime = 0


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if nextPedal == null && direction != 0:
		nextPedal = direction
		
	if direction == nextPedal:
		currentPedalTime += delta
		accelTime += delta
		velocity.y = clamp(-5 * (1 + accelTime*2), -MAXSPEED, 0) 
		if currentPedalTime >= clamp(((1 - accelTime) * PEDALSPEED), MIN_PEDAL_TIME, PEDALSPEED):
			print("Switch!")
			nextPedal = -direction
			currentPedalTime = 0
		
	else:
		velocity.y = move_toward(velocity.y, 0, 20)
	move_and_slide()
