extends Node2D

var score = 0 setget set_score

func set_score(value):
	print("Scroe value: "+str(value))
	score = value
	get_node("Score").set_text("Score : "+str(score))