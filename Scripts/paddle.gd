extends KinematicBody2D

# Load resource from miniscene resoureces
const ball_scene = preload("res://Mini Scenes/ball.tscn")

func _ready():
	# Set fixed process to get loop function
	set_fixed_process(true)
	set_process_input(true)
	print("Paddle pos: "+str(get_pos()))

# Loop Function
func _fixed_process(delta):
	# Get Y Possition of paddle node
	var y = get_pos().y
	# Get X mouse pointer from viewport
	var mouse_x = get_viewport().get_mouse_pos().x
	# Apply paddle possition follow the mouse X position and stay
	# in the Y position of paddle
	set_pos(Vector2(mouse_x,y))
	
func _input(event):
	# Get input from mouse if Clicked
	if event.type == InputEvent.MOUSE_BUTTON && event.is_pressed():
		var ball_count = get_node("/root/World").ball_count
		if ball_count == 0:
			var ball = ball_scene.instance()
			ball.set_pos(get_pos() - Vector2(0,16))
			get_tree().get_root().add_child(ball)