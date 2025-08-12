extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var screenSize
var time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = Vector2(0,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	screenSize.x = get_viewport().get_visible_rect().size.x # Get Width
	screenSize.y = get_viewport().get_visible_rect().size.y # Get Height
	rect_position.x = (screenSize.x - 246) - 60
	rect_position.y = 60
	
	time += delta
	time = stepify(time,0.01)
	text = str(floor(time / 60)) + ":" + str(fmod(time, 60))
