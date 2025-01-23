extends CharacterBody2D


const MAXSPEED = 400.0
const STEPS_TO_MAXSPEED = 10.0
const SPEED = 100
const MAX_SLOW_DOWN_TIME = 3.0
#
var currentPedal = null
var currentStartSpeed = null

var st = 0.0
var slow_vel = null
var idlePedalTime = 0.0
var currentSlowDownTime = 0.0
var currentPedalSteps = 0.0

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")

	if direction == 0 && velocity.y != 0:
		if idlePedalTime > 0.4:
			if slow_vel == null:
				st = 0.0
				slow_vel = velocity.y
				currentPedalSteps = 0.0
				currentSlowDownTime = MAX_SLOW_DOWN_TIME * (abs(slow_vel) / MAXSPEED)
			slow_down()
			st += delta
		else:
			idlePedalTime += delta
	else:
		if direction != currentPedal:
			if slow_vel != null || currentStartSpeed == null: 
				print("stop slow")
				# Stop slowing down
				currentSlowDownTime = null
				slow_vel = null
				# Set start speed
				currentStartSpeed = velocity.y
				
			currentPedalSteps = clamp(currentPedalSteps+1, 0.0, STEPS_TO_MAXSPEED)
			set_next_pedal(direction)
			increase_speed()
		else:
			velocity.x += 5 * direction
	print(velocity)
	move_and_slide()
	
func turn(direction):
	velocity.x += direction * 5
	
func increase_speed():	
	idlePedalTime = 0.0
	var diff = MAXSPEED - abs(currentStartSpeed)
	var progress = currentPedalSteps / STEPS_TO_MAXSPEED
	var ease = ease(progress, -3.3)
	var result = abs(currentStartSpeed) + (diff * ease)

	velocity.y = -result
	
func set_next_pedal(newpedal):
	currentPedal = newpedal
	
func slow_down():
	var progress = 1 - ease(st / MAX_SLOW_DOWN_TIME, 0.4)
	velocity.y = slow_vel * progress
