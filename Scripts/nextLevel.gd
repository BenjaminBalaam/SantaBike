extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var screenSize
var file
var lastLevel = false

# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = Vector2(0,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if lastLevel:
		visible = false
	screenSize.x = get_viewport().get_visible_rect().size.x # Get Width
	screenSize.y = get_viewport().get_visible_rect().size.y # Get Height
	margin_left = screenSize.x * 0.048828125
	margin_right = screenSize.x * 0.451171875
	margin_top = screenSize.y * 0.666666667
	margin_bottom = screenSize.y * 0.916666667

func _on_play_again_pressed():
	file = File.new()
	global.current_level += 1
	if file.file_exists("res://Scenes/Level_" + str(global.current_level) + ".tscn"):
		get_tree().change_scene("res://Scenes/Bike Start Screen.tscn")
