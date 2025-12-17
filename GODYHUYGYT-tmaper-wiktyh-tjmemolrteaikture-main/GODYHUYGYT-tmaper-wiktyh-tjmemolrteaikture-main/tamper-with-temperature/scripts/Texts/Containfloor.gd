extends Label

@onready var game: Node2D = $"../.."

var winReq

func _process(float)->void:
	winReq = game.winReq
	
	text = "Win Requirement: " + str(winReq) + "° C"
