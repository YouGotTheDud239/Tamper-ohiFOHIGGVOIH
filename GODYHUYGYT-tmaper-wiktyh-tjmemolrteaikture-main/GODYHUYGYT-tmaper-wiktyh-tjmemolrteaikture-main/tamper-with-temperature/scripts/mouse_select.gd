extends CharacterBody2D
@export var xpos: int = 0
@export var ypos: int = 0
var currentPos = [-160,-160]

func _ready():
	self.position = Vector2(currentPos[0], currentPos[1])

func _input(event):
	if event.is_action_pressed("ui_right"):
		xpos += 1
		if xpos < 10:
			currentPos[0] += 32
		else:
			xpos = 9
	elif event.is_action_pressed("ui_left"):
		xpos -= 1
		if xpos > -1:
			currentPos[0] -= 32
		else:
			xpos = 0
	elif event.is_action_pressed("ui_down"):
		ypos += 1
		if ypos < 10:
			currentPos[1] += 32
		else:
			ypos = 9
	elif event.is_action_pressed("ui_up"):
		ypos -= 1
		if ypos > -1:
			currentPos[1] -= 32
		else:
			ypos = 0
	self.position = Vector2(currentPos[0], currentPos[1])
