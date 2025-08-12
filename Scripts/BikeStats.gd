extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var backWheel
var frontWheel
var frame
var damping
var weight

# Called when the node enters the scene tree for the first time.
func _ready():
	frame = $Frame
	backWheel = $WheelBack
	frontWheel = $WheelFront
	damping = global.damping
	weight = global.weight
	
	backWheel.angular_damp = damping
	frontWheel.angular_damp = damping
	
	frame.weight = weight
	backWheel.weight = weight / 2
	frontWheel.weight = weight / 2
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
