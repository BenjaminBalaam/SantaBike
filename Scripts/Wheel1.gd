extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	bike = $"../Frame"

var maxVelocityProportion
var multiplier
var bike
var dead = false
var pressed = false

var speed = Vector2(global.speed, 0)

func _integrate_forces(_state):
	if dead == false:
		if Input.is_action_just_pressed("accelerate"):
			if pressed == false:
				add_force(Vector2(460,184),speed)
				add_force(Vector2(460,204),(speed*-1))
				bike.turn1 = (speed/-50)
				bike.turn2 = (speed/50)
				pressed = true
		elif Input.is_action_just_released("accelerate"):
			if pressed == true:
				add_force(Vector2(460,184),(speed*-1))
				add_force(Vector2(460,204),speed)
				bike.turn1 = (speed/50)
				bike.turn2 = (speed/-50)
				pressed = false
#	if Input.is_action_pressed("accelerate"):
#		maxVelocityProportion = angular_velocity / 100
#		multiplier = 1 - maxVelocityProportion
#		if multiplier <= 0:
#			set_applied_torque(0)
#			bike.turn = 0
#		else:
#			set_applied_torque(50000 * multiplier)
#			bike.turn = 50000 * multiplier
#	else:
#		set_applied_torque(angular_velocity * -500)
#		bike.turn = angular_velocity * -500

