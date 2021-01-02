extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var screenSize
var colorRect
var bikeUsing
var speedBar
var dampingBar
var weightBar
var speedLabel
var dampingLabel
var weightLabel
var Continue
var released = false

# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = Vector2(0,0)
	colorRect = $ColorRect
	bikeUsing = $CanvasLayer/BikeUsing
	speedBar = $CanvasLayer/Speed
	dampingBar = $CanvasLayer/Damping
	weightBar = $CanvasLayer/Weight
	speedLabel = $CanvasLayer/SpeedLabel
	dampingLabel = $CanvasLayer/DampingLabel
	weightLabel = $CanvasLayer/WeightLabel
	Continue = $CanvasLayer/continue
	$HTTPRequest.request("https://smolpxl.artificialworlds.net/s/event.php", ["Content-Type: text/plain; charset=UTF-8"], true, HTTPClient.METHOD_POST, "santabike.played")
	
	if global.current_level >= 1 and global.current_level <= 4:
		bikeUsing.text = "You are using Bike #1!"
		speedBar.value = 25
		dampingBar.value = 75
		weightBar.value = 50
		global.speed = 4000
		global.damping = 20
		global.weight = 20
	elif global.current_level >= 5 and global.current_level <= 7:
		bikeUsing.text = "You are using Bike #2!"
		speedBar.value = 50
		dampingBar.value = 25
		weightBar.value = 75
		global.speed = 5000
		global.damping = 10
		global.weight = 30
		colorRect.color = Color(0.3333333333, 0.333333333333, 1, 1)
	elif global.current_level >= 8 and global.current_level <= 10:
		bikeUsing.text = "You are using Bike #3!"
		speedBar.value = 75
		dampingBar.value = 25
		weightBar.value = 25
		global.speed = 5500
		global.damping = 15
		global.weight = 10
		colorRect.color = Color(1, 0.3333333333, 0.333333333333, 1)
	else:
		bikeUsing.text = "You're using no bike at all!"
		global.speed = 0
		global.damping = 0
		global.weight = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	screenSize.x = get_viewport().get_visible_rect().size.x # Get Width
	screenSize.y = get_viewport().get_visible_rect().size.y # Get Height
	colorRect.rect_size.y = screenSize.y
	colorRect.rect_size.x = screenSize.x
	bikeUsing.rect_size.y = screenSize.y / 2
	bikeUsing.rect_size.x = screenSize.x
	speedBar.rect_position.x = screenSize.x / 4
	speedBar.rect_size.x = screenSize.x / 2
	speedBar.rect_position.y = screenSize.y / 2
	speedBar.rect_size.y = screenSize.y / 15
	dampingBar.rect_position.x = screenSize.x / 4
	dampingBar.rect_size.x = screenSize.x / 2
	dampingBar.rect_position.y = screenSize.y / 1.6
	dampingBar.rect_size.y = screenSize.y / 15
	weightBar.rect_position.x = screenSize.x / 4
	weightBar.rect_size.x = screenSize.x / 2
	weightBar.rect_position.y = screenSize.y / 1.333333333
	weightBar.rect_size.y = screenSize.y / 15
	speedLabel.rect_position.x = screenSize.x / 20.48
	speedLabel.rect_size.x = (screenSize.x / 8) + (screenSize.x / 16)
	speedLabel.rect_position.y = (screenSize.y / 2) - 5
	speedLabel.rect_size.y = screenSize.y / 12
	dampingLabel.rect_position.x = screenSize.x / 20.48
	dampingLabel.rect_size.x = (screenSize.x / 8) + (screenSize.x / 16)
	dampingLabel.rect_position.y = (screenSize.y / 1.6) - 5
	dampingLabel.rect_size.y = screenSize.y / 12
	weightLabel.rect_position.x = screenSize.x / 20.48
	weightLabel.rect_size.x = (screenSize.x / 8) + (screenSize.x / 16)
	weightLabel.rect_position.y = (screenSize.y / 1.333333333) - 5
	weightLabel.rect_size.y = screenSize.y / 12
	Continue.rect_size.x = screenSize.x
	Continue.rect_size.y = screenSize.y / 6
	Continue.rect_position.y = (screenSize.y / 6) * 5
	
	if !Input.is_action_pressed("accelerate"):
		released = true
	
	if Input.is_action_just_pressed("accelerate"):
		if released == true:
			get_tree().change_scene("res://Scenes/Level_" + str(global.current_level) + ".tscn")
