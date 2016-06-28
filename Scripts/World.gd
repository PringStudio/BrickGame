extends Node2D

var score = 0 setget set_score
var ball_count = 0 setget set_ball_count
var bricks_count = 0
var time_sec = 0

var level_number = 1
var level = null

func _ready():
	change_level(level_number)	
	set_fixed_process(true)

func _draw():
	change_level(level_number)


func _fixed_process(delta):
	bricks_count = level.get_child_count()
	
	if bricks_count == 0:
		ball_count = 0
		level_number += 1
		change_level(level_number)

func set_score(value):
	print("Scroe value: "+str(value))
	# Set Value to the score
	score = value
	# Apply score value to Score label node
	get_node("Score").set_text("Score : "+str(score))

func set_ball_count(value):
	ball_count = value
	print("Ball count: "+str(ball_count))
	
func change_level(value):
	print("Change level value: "+str(value))
	var level_stage
	if value == 1:
		level_stage = preload("res://Scenes/level_1.tscn")
	elif value == 2:
		level_stage = preload("res://Scenes/level_2.tscn")
	elif value == 3:
		level_stage = preload("res://Scenes/level_3.tscn")
	else :
		change_level(1)
	
	get_node("Level").set_text("Level : "+str(value))
	
	
	if level_stage != null:
		level = level_stage.instance()
		level.set_pos(get_pos() - Vector2(0,-16))
		get_tree().get_root().add_child(level)

func _on_Timer_timeout():
	time_sec += 1
	get_node("Time").set_text("Time : "+str(time_sec)+" sec")
