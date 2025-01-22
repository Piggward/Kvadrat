extends CharacterBody2D


const MAXSPEED = 300.0
const PEDAL_TIME = 0.4
const SPEED = 50

var currentPedal = null
var currentPedalTime = 0.0


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction == 0:
		velocity.y = move_toward(velocity.y, 0, 5)

	elif direction != currentPedal:
		currentPedal = direction
		velocity.y += -SPEED
	
	elif direction == currentPedal:
		velocity.x += direction * 5
		currentPedalTime += delta
		
		#accelTime += delta
		#velocity.y = clamp(-5 * (1 + accelTime*2), -MAXSPEED, 0) 
		#if currentPedalTime >= clamp(((1 - accelTime) * PEDALSPEED), MIN_PEDAL_TIME, PEDALSPEED):
			#print("Switch!")
			#currentPedal = -direction
			#currentPedalTime = 0

	move_and_slide()
