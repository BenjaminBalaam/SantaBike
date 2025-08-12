extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var screenSize

# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = Vector2(0,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	screenSize.x = get_viewport().get_visible_rect().size.x # Get Width
	screenSize.y = get_viewport().get_visible_rect().size.y # Get Height
	rect_position.x = screenSize.x / 76.8
	rect_position.y = screenSize.y / 43.2

func _on_BackButton_pressed():
	global.current_level = 0
	get_tree().change_scene("res://Scenes/Level Select.tscn")
