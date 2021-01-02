extends Button

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var screenSize
var button
var relPos = Vector2(40,20)
var relSize = Vector2(2.5,15)
var addedPos = Vector2(0,0)
var level
var file
var comingSoon
var label
var timer

# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = Vector2(0,0)
	timer = $Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	screenSize.x = get_viewport().get_visible_rect().size.x # Get Width
	screenSize.y = get_viewport().get_visible_rect().size.y # Get Height
	if addedPos.x == 0:
		rect_position.x = (screenSize.x / relPos.x)
	else:
		rect_position.x = screenSize.x - (screenSize.x / relPos.x) - (screenSize.x / relSize.x)
	rect_position.y = ((screenSize.y / relPos.y) * ((addedPos.y + 1) * 2)) + ((screenSize.y / relSize.y) * addedPos.y)
	rect_size.y = screenSize.y / relSize.y
	rect_size.x = screenSize.x / relSize.x


func _on_Level_Button_Template_pressed():
	file = File.new()
	if file.file_exists("res://Scenes/Level_" + level + ".tscn"):
		get_tree().change_scene("res://Scenes/Bike Start Screen.tscn")
		global.current_level = int(level)
	else:
		timer.start()
		label = get_tree().get_root().get_node("Level Select").get_node("CanvasLayer/Label")
		label.show()


func _on_Timer_timeout():
	label.hide()
