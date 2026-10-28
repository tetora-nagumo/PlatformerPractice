extends Node

var current_area = 1
var area_path = "res://Assests/Scenes/Areas/"

var pick_ups = 0

func _ready():
	reset_pick_ups()


func next_level():
	current_area += 1
	var full_path = area_path + "area_" + str(current_area) + ".tscn"
	get_tree().change_scene_to_file(full_path)
	print("player has moved to area " + str(current_area))
	set_up_area()
	
func set_up_area():
	reset_pick_ups()
	
func add_pick_ups():
	pick_ups += 1
	if pick_ups >= 5:
		var portal = get_tree().get_first_node_in_group("area_exits") as AreaExit
		portal.open()
	
func reset_pick_ups():
	pick_ups = 0
