extends Label

@onready var mouse_select: CharacterBody2D = %"Mouse Select"
@onready var tile_spawner: Node2D = %TileSpawner
@onready var game: Node2D = $"../.."

var createsTemp = tile_spawner.id_tile[int(str(mouse_select.xpos)+str(mouse_select.ypos))]

func _process(float)->void:
	createsTemp = tile_spawner.id_tile[int(str(mouse_select.xpos)+str(mouse_select.ypos))]
	
	text = "Temperature Made: " + str(createsTemp) + "° C"
