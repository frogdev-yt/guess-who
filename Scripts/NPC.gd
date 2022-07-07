extends KinematicBody2D

var xdir = 0
var behaviour = "stand"
var gravity = 0.3
var velx = 0
var vely = 0
var accel = 0.5
var maxspeed = 2
var friction = 0.05
var onground = false
var jumpheight = 5
var timeconst = 100
var timer = 0
var decisiontimerstart = 0
var maxdecidetime = 3
var decidetime = 3
var decisionchoices = ["walk","jump","stand"]
var decision
var colly = null
onready var networknode = get_tree().root.get_node("NetworkSetup")

func _ready():
	makedecision()

func _process(delta):
	if get_tree().is_network_server():
		timer += delta
		
		if timer - decisiontimerstart >= decidetime:
			makedecision()
		
		if xdir != 0:
			velx += accel * xdir * delta * timeconst
			if abs(velx) > maxspeed:
				velx *= maxspeed / abs(velx)
		else:
			velx -= velx * friction * delta * timeconst
		
		vely += gravity * delta * timeconst
		
		if vely > 0 && colly:
			if colly.collider.name == "Floor":
				onground = true
				vely = 0
			if colly.collider.get_class() == "KinematicBody2D":
				vely = 0.1
		else:
			onground = false
		
		if decision == "jump" && onground == true:
			jump()
		
		if global_position.y > 10000:
			global_position = Vector2.ZERO
		
		if networknode.entities.has(name):
			networknode.entities[name]["position"] = global_position
			networknode.entities[name]["velx"] = velx
			networknode.entities[name]["vely"] = vely
	
	move_and_slide(Vector2(velx * timeconst,0))
	colly = move_and_collide(Vector2(0,vely * delta * timeconst))

func makedecision():
	randomize()
	decidetime = rand_range(0,maxdecidetime)
	randomize()
	decision = decisionchoices[rand_range(0,decisionchoices.size())]
	
	if decision != "stand":
		randomize()
		xdir = round(rand_range(1,2))
		if xdir == 1:
			xdir = -1
		if xdir == 2:
			xdir = 1
	else:
		xdir = 0
	
	decisiontimerstart = timer

func jump():
	vely = -jumpheight
	velx *= 1.2
