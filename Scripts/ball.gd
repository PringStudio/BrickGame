extends RigidBody2D

export var speedup = 4
const MAXSPEED = 400

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group("Bricks"):
			get_node("/root/World").score += 5
			body.queue_free()
			
		if body.get_name() == "Paddle":
			var speed = get_linear_velocity().length()
			var direction = get_pos() - body.get_node("Ancor").get_global_pos()
			var velocity = direction.normalized()*min(speed+speedup,MAXSPEED)
			print(velocity)
			set_linear_velocity(velocity)
			
	if get_pos().y > get_viewport_rect().end.y:
		print("Died")
		queue_free()