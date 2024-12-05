extends CharacterBody2D

@onready var tilemap = get_tree().current_scene.find_child("TileMap")

var step_size : int = 7

var distance_in_pixel : float = 0.0:
	set(value):
		distance_in_pixel = value
		var step = distance_in_pixel / step_size
		
		if step >= Manager.encounter_number:
			set_physics_process(false)
			
			Manager.save_player_data(self)
			Manager.change_scene()

func _ready():
	position = Manager.player_last_postion

func _physics_process(delta):
	var initial_position = position
	
	velocity = Input.get_vector("ui_left","ui_right","ui_up","ui_down") * 400
	move_and_slide()
	
	distance_in_pixel += position.distance_to(initial_position)
	
	
