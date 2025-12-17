extends Node2D

@onready var tileff = preload("res://scenes/tile.tscn")
@export var id_tile : Array = []

func _ready():
	var y: int = 0
	var x: int = 0
	for n2inx in range(10):
		for ninx in range(10): 
			var tilesy = tileff.instantiate()
			tilesy.setpos((x-4.5)*32,(y-4.5)*32)
			tilesy.tileCLASS.xy = Vector2i(n2inx, ninx)
			get_parent().get_node("tile_handler").add_child(tilesy)
			id_tile.append(tilesy)
			y += 1
		x += 1
		y = 0

#func _process(float)->void:
#	self.position = Vector2(xy[0], xy[1])
