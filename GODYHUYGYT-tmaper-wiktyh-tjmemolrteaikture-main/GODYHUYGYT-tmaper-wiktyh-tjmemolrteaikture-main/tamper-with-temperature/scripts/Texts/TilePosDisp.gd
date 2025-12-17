extends Label

@onready var mouse_select: CharacterBody2D = %"Mouse Select"

func _process(float)->void:
	text = "Tile Selected: " + str(mouse_select.xpos) + ", " + str(mouse_select.ypos)
