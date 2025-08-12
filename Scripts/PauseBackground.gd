extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var screenSize
var pauseMenu

# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = Vector2(0,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	screenSize.x = get_viewport().get_visible_rect().size.x # Get Width
	screenSize.y = get_viewport().get_visible_rect().size.y # Get Height
	rect_size.x = screenSize.x
	rect_size.y = screenSize.y
