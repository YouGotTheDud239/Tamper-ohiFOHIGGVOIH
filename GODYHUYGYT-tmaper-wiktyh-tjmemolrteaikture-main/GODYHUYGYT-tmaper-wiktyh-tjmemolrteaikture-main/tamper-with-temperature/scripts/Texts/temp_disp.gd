extends Label

@onready var tile_spawner: Node2D = %TileSpawner
@onready var mouse_select: CharacterBody2D = %"Mouse Select"

func _process(float)->void:
	text = "Tile Temperature: " + str(tile_spawner.id_tile[int(str(mouse_select.xpos)+str(mouse_select.ypos))].temp)
