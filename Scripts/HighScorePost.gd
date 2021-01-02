extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var screenSize

# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = Vector2(0,0)
	connect("request_completed", self, "_on_request_completed")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	screenSize.x = get_viewport().get_visible_rect().size.x # Get Width
	screenSize.y = get_viewport().get_visible_rect().size.y # Get Height
	rect_position.x = screenSize.x * 0.134277344
	rect_position.y = screenSize.y * 0.458333333
	rect_size.x = screenSize.x * 0.731445313
	rect_size.y = screenSize.y / 6


func _on_Highscore_pressed():
	global.highscore_level = global.current_level
	global.post = true
	get_tree().change_scene("res://Scenes/Scoreboard.tscn")
