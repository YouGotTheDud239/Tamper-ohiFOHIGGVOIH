extends Label

@onready var game: Node2D = $"../.."

var reqTilex
var reqTiley

func _process(float)->void:
	reqTilex = game.winTilex
	reqTiley = game.winTiley
	
	text = "Which Tile? : " + str(reqTilex) + ", " + str(reqTiley)
