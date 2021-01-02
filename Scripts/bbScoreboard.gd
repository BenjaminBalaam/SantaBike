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
	
	rect_position.x = screenSize.y * 0.041666667
	rect_position.y = (screenSize.y - 120) - screenSize.y * 0.041666667



func _on_BackButton_pressed():
	if !global.post:
		get_tree().change_scene("res://Scenes/Level Scoreboard Select.tscn")
	else:
		get_tree().change_scene("res://Scenes/Completed.tscn")
		global.post = false
