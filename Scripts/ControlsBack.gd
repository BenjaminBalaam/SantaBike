extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var screenSize

var controls
var controlsButton
var controlsBack
var startGame
var logo
var background
var highscore

# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = Vector2(0,0)

	controls = $"../Controls"
	controlsButton = $"../ControlsButton"
	controlsBack = $"../ControlsBack"
	startGame = $"../StartGame"
	logo = $"../Logo"
	background = $"../Background"
	highscore = $"../Highscore"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	screenSize.x = get_viewport().get_visible_rect().size.x # Get Width
	screenSize.y = get_viewport().get_visible_rect().size.y # Get Height
	margin_left = screenSize.x * 0.1953125
	margin_right = screenSize.x * 0.8046875
	margin_top = screenSize.y * 0.6666667
	margin_bottom = screenSize.y * 0.9166667


func _on_ControlsBack_pressed():
	startGame.show()
	controlsButton.show()
	logo.show()
	background.show()
	highscore.show()
	controlsBack.hide()
	controls.hide()
