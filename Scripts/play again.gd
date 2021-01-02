extends Button


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
	margin_left = screenSize.x * 0.048828125
	margin_right = screenSize.x * 0.451171875
	margin_top = screenSize.y * 0.6666667
	margin_bottom = screenSize.y * 0.9166667

func _on_play_again_pressed():
	get_tree().change_scene("res://Scenes/Level_" + str(global.current_level) + ".tscn")
