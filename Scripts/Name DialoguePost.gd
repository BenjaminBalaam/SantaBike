extends WindowDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var entered_name

# Called when the node enters the scene tree for the first time.
func _ready():
	if global.post:
		get_tree().paused = true
		popup_centered()
	$LineEdit.text = global.previous_name

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !is_visible():
		get_tree().paused = false


func _on_Button_pressed():
	hide()
	entered_name = $LineEdit.text
	global.previous_name = $LineEdit.text
	if global.post == true:
		var input = {"appId": "1ff7a39e-55db-4b0b-8b03-e282c88acb79","name": entered_name,"score": global.time,"notes": ""}
		$"../HTTPRequest2".request("https://scores.artificialworlds.net/api/v1/santabike/level" + str(global.highscore_level).pad_zeros(2) + "/", [], true, HTTPClient.METHOD_POST, JSON.print(input))
	else:
		$"../HTTPRequest3".request("https://scores.artificialworlds.net/api/v1/santabike/level" + str(global.highscore_level).pad_zeros(2) + "/?startName=" + entered_name.http_escape() + "&offset=-5&num=10")

func _on_HTTPRequest2_request_completed(result, response_code, headers, body):
	if response_code == 204:
		$"../NothingChanged".popup_centered()
		$"../HTTPRequest3".request("https://scores.artificialworlds.net/api/v1/santabike/level" + str(global.highscore_level).pad_zeros(2) + "/?startName=" + entered_name.http_escape() + "&offset=-5&num=10")
	elif response_code / 100 == 2:
		$"../HTTPRequest3".request("https://scores.artificialworlds.net/api/v1/santabike/level" + str(global.highscore_level).pad_zeros(2) + "/?startName=" + entered_name.http_escape() + "&offset=-5&num=10")
	else:
		$"../SomethingWrong".popup_centered()
	$"../Centre/Table Top".hide()
	$"../Centre/Table Personalised".show()



func _on_HTTPRequest3_request_completed(result, response_code, headers, body):
	if response_code == 404:
		$"../NameNotExisted".popup_centered()
		$"../../Node2D".done = true
	elif response_code / 100 == 2:
		$"../../Node2D".done = true
		var json = JSON.parse(body.get_string_from_utf8())
		for i in range(len(json.result.results)):
			get_node("../Centre/Table Personalised/Row " + str(i + 1) + "/Label1").text = "#" + json.result.results[i].rank + " "
			get_node("../Centre/Table Personalised/Row " + str(i + 1) + "/Label2").text = " " + json.result.results[i].player_name + " "
			get_node("../Centre/Table Personalised/Row " + str(i + 1) + "/Label3").text = " " + str(int(json.result.results[i].score) / 60) + ":" + str(stepify(fmod(float(json.result.results[i].score), 60), 0.01))
	else:
		$"../SomethingWrong".popup_centered()
		$"../Centre/Table Top/Row 1/Label1".text = "-"
		$"../Centre/Table Top/Row 1/Label2".text = "-"
		$"../Centre/Table Top/Row 1/Label3".text = "-"


