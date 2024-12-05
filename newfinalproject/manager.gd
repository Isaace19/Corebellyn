extends Node2D

@export var battle_scene : PackedScene

var encounter_number : int = 100:
	set(value):
		encounter_number = value

var player_last_postion: Vector2 = Vector2(100,100)

func _ready():
	randomize()
	encounter_number = randi_range(200,250)
	
func change_scene():
	get_tree().change_scene_to_packed(battle_scene)
	encounter_number = randi_range(200,250)

func save_player_data(player):
	player_last_postion = player.position
