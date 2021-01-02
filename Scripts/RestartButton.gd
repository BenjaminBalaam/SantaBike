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
	rect_position.x = screenSize.x / 20.48
	rect_position.y = screenSize.y - (screenSize.y / 12)


func _on_RestartButton_pressed():
	get_tree().change_scene("res://Scenes/PlaceHolderScene.tscn")
