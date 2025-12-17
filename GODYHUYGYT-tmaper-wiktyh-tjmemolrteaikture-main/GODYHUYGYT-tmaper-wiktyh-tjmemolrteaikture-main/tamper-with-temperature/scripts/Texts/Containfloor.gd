extends Label

@onready var mouse_select: CharacterBody2D = %"Mouse Select"
@onready var tile_spawner: Node2D = %TileSpawner
@onready var game: Node2D = $"../.."


func _process(float)->void:
	
	text = "Temperature Made: " + str(tile_spawner.id_tile[int(str(mouse_select.xpos)+str(mouse_select.ypos))].diffuseAmount) + "° C"
