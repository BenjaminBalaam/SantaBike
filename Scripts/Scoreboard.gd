extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var screenSize
var once = false
var done = false

# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = Vector2(0,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	screenSize.x = get_viewport().get_visible_rect().size.x # Get Width
	screenSize.y = get_viewport().get_visible_rect().size.y # Get Height
	$"Centre/Table Top".rect_size.y = screenSize.y
	$Centre.rect_size.x = screenSize.x
	$Centre.rect_size.y = screenSize.y
	if !once:
		if done:
			$HTTPRequest.request("https://scores.artificialworlds.net/api/v1/santabike/level" + str(global.highscore_level).pad_zeros(2) + "/?startRank=1&num=10")
			once = true


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	if response_code / 100 == 2:
		var json = JSON.parse(body.get_string_from_utf8())
		for i in range(len(json.result.results)):
			get_node("Centre/Table Top/Row " + str(i + 1) + "/Label1").text = "#" + json.result.results[i].rank + " "
			get_node("Centre/Table Top/Row " + str(i + 1) + "/Label2").text = " " + json.result.results[i].player_name + " "
			get_node("Centre/Table Top/Row " + str(i + 1) + "/Label3").text = " " + str(int(json.result.results[i].score) / 60) + ":" + str(stepify(fmod(float(json.result.results[i].score), 60), 0.01))
	else:
		$SomethingWrong.popup_centered()
