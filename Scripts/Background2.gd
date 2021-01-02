extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var camera

# Called when the node enters the scene tree for the first time.
func _ready():
	camera = $"../Bike".get_child(2).get_child(2)


func _process(delta):
	#position = camera.global_position / 1.2
	pass
