extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var screenSize

var controls
var controlsButton
var controlsBack
var startGame

# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = Vector2(0,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	screenSize.x = get_viewport().get_visible_rect().size.x # Get Width
	screenSize.y = get_viewport().get_visible_rect().size.y # Get Height
	margin_left = screenSize.x * 0.048828125
	margin_right = screenSize.x * 0.451171875
	rect_position.y = screenSize.y / 2.5



func _on_StartGame_pressed():
	get_tree().change_scene("res://Scenes/Level Select.tscn")
