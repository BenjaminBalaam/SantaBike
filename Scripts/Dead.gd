extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var alpha = 0
var screenSize
var died
var lastLevel = false

# Called when the node enters the scene tree for the first time.
func _ready():
	global.completed = false
	screenSize = Vector2(0,0)
	died = $Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	screenSize.x = get_viewport().get_visible_rect().size.x # Get Width
	screenSize.y = get_viewport().get_visible_rect().size.y # Get Height
	if alpha < 0.5:
		alpha += delta
		if alpha > 0.5:
			alpha = 0.5
	color = Color(0,0,0,alpha)
	rect_size.x = screenSize.x
	rect_size.y = screenSize.y
	died.rect_size.y = screenSize.y / 2
	died.rect_size.x = screenSize.x
	
	if get_tree().get_current_scene().get_name() == "Dead":
		if Input.is_action_just_pressed("restart"):
			get_tree().change_scene("res://Scenes/PlaceHolderScene.tscn")
	else:
		if global.current_level == 10:
			died.text = "Game Complete!"
			lastLevel = true
			$nextLevel.lastLevel = true
			$"Level Select".lastLevel = true
