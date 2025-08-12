extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var screenSize
var tex

# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = Vector2(0,0)


# Called every frame. 'delta' is the elapsed time since the previous frame
func _process(delta):
	screenSize.x = get_viewport().get_visible_rect().size.x # Get Width
	screenSize.y = get_viewport().get_visible_rect().size.y # Get Height
	position.x = screenSize.x / 2
	position.y = screenSize.y / 2
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	tex = ImageTexture.new()
	tex.create_from_image(global.img)
	texture = tex
