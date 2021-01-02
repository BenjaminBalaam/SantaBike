extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var turn1 = null
var turn2 = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _integrate_forces(_state):
	if turn1 != null or turn2 != null:
		add_force(Vector2(460,184),turn1)
		add_force(Vector2(460,204),turn2)
		turn1 = null
		turn2 = null
	#set_applied_torque(turn * -1)
	#print(angular_velocity)
