extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var screenSize
var pauseMenu
var background

# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = Vector2(0,0)
	pauseMenu = get_node("../WindowDialog")
	pauseMenu.set_exclusive(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	screenSize.x = get_viewport().get_visible_rect().size.x # Get Width
	screenSize.y = get_viewport().get_visible_rect().size.y # Get Height
	rect_position.x = screenSize.x / 20.48
	rect_position.y = screenSize.y / 12

func _on_MenuButton_pressed():
	background = get_node("../ColorRect")
	pauseMenu = get_node("../WindowDialog")
	get_tree().paused = true
	pauseMenu.popup_centered()
	background.show()

func _on_Quit_To_Start_pressed():
	global.current_level = 0
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/Main.tscn")


func _on_Restart_Level_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/PlaceHolderScene.tscn")


func _on_Return_To_Game_pressed():
	background = get_node("../ColorRect")
	pauseMenu = get_node("../WindowDialog")
	get_tree().paused = false
	pauseMenu.hide()
	background.hide()

func _on_WindowDialog_popup_hide():
	background = get_node("../ColorRect")
	pauseMenu = get_node("../WindowDialog")
	get_tree().paused = false
	pauseMenu.hide()
	background.hide()
