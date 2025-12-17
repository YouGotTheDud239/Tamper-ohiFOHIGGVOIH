extends CharacterBody2D


@onready var tile_spawner: Node2D = %TileSpawner
@onready var mouse_select: CharacterBody2D = %"Mouse Select"

@export var tileCLASS: tilesofclass

@export var temp : float
@export var cool: float 
@export var heat : float 
@export var color: Color 
@export var diffusion_rate: float = 1.0

@export var DifUp: bool 
@export var DifDown: bool 
@export var DifLeft: bool 
@export var DifRight: bool 

@export var DifUpNum: float 
@export var DifDownNum: float 
@export var DifLeftNum: float 
@export var DifRightNum: float 

@export var numTiles: float

@export var createsTemp : float
@export var diffuseAmount: float = 1.0


var xy = [-144,-144]
var xpos
var ypos

func _ready():
	startup_crap()
	diffuse()

func _process(float)->void:
	self.position = Vector2(xy[0], xy[1])
	self.modulate = get_color()


func startup_crap():
	temp = tileCLASS.temp
	var xy = tileCLASS.xy
	var color = tileCLASS.color
	self.modulate = get_color()


func setpos(x:int, y:int):
	xy[0] = x
	xy[1] =y
	xpos = (float(x) / 32) - 0.5
	ypos = (float(y) / 32) - 0.5


func get_color():
	cool = ((temp - 23)/-150) * 0.4
	heat = ((temp - 23)/150) * 0.4
	if heat < 0:
		heat = 0
	if cool < 0:
		cool = 0
	if heat > 0.35:
		heat = 0.35
	if cool > 0.35:
		cool = 0.35
	color = Color(0.6 + heat - (cool*0.6),0.6- (heat*0.6) - (cool*0.6),0.6 + cool - (heat*0.6),1)
	return color


func diffuseCheck():
	if int(ypos) + -1 < -5:
		DifUp = false
		DifUpNum = 0
		temp = 21111
	else:
		DifUp = true
		DifUpNum = get_parent().id_tile[int(str(xpos)+str(ypos-1))].temp 
		numTiles += 1
	if int(ypos) + 1 > 4:
		DifDown = false
		DifDownNum = 0
		temp = 2222
	else:
		DifDown = true
		DifDownNum = get_parent().id_tile[int(str(xpos)+str(ypos+1))].temp
		numTiles += 1
	if int(xpos) + -1 < -5:
		DifLeft = false
		DifLeftNum = 0
		temp = -22222
	else:
		DifLeft = true
		DifLeftNum = get_parent().id_tile[int(str(xpos - 1)+str(ypos))].temp
		numTiles += 1
	if int(xpos) + 1 > 4:
		DifRight = false
		DifRightNum = 0
		temp = -2222
	else:
		DifRight = true
		DifRightNum = get_parent().id_tile[int(str(xpos + 1) + str(ypos))].temp
		numTiles += 1


func diffuse():
	diffuseCheck()
	temp = (DifRightNum + DifDownNum + DifUpNum + DifLeftNum)/numTiles 

func wait(seconds):
	await get_tree().create_timer(seconds).timeout
