extends Node

var img
var screenSize
var current_level = 0
var speed = 0
var damping = 0
var weight = 0
var completed = false
var highscore_level = 0
var post = false
var time = 0
var previous_name = ""

func _ready():
	screenSize = Vector2(0,0)

func _process(delta):
	screenSize.x = get_viewport().get_visible_rect().size.x # Get Width
	screenSize.y = get_viewport().get_visible_rect().size.y # Get Height
	if img != null:
		img.resize(screenSize.x,screenSize.y,0)
