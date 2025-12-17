extends Node
const TILE = preload("uid://dbednje38fjcg")


@onready var tile_spawner: Node2D = $TileSpawner
@onready var mouse_select: CharacterBody2D = $"Mouse Select"

@export var levelNum : int = 1
@export var winReq : float
@export var winTilex : int
@export var winTiley : int


var numonmouse: int = 0

func _ready():
	await wait(2)



func _process(float)->void:
	numonmouse = int(str(mouse_select.xpos)+str(mouse_select.ypos))
	levelize()

func _input(event):
	if event.is_action_pressed("selectorplace"):
		var tileonmouse = tile_spawner.id_tile[numonmouse]
		tileonmouse.temp = -444.0
		print(tileonmouse)
		print(numonmouse)
		print(tileonmouse.temp)
		

func wait(seconds):
	await get_tree().create_timer(seconds).timeout


func levelize():
	if levelNum == 1:
		winReq = 50.0
		winTilex = 5
		winTiley = 5
