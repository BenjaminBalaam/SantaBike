extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var screenSize
var lastLevel = false

# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = Vector2(0,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	screenSize.x = get_viewport().get_visible_rect().size.x # Get Width
	screenSize.y = get_viewport().get_visible_rect().size.y # Get Height
	if !lastLevel:
		margin_left = screenSize.x * 0.548828125
		margin_right = screenSize.x * 0.951171875
	else:
		margin_left = screenSize.x * 0.231445313
		margin_right = screenSize.x * 0.768554688
	margin_top = screenSize.y * 0.6666667
	margin_bottom = screenSize.y * 0.9166667

func _on_play_again_pressed():
	global.current_level = 0
	get_tree().change_scene("res://Scenes/Level Select.tscn")
