extends KinematicBody2D

var inputx = 0
var gravity = 0.3
var velx = 0
var vely = 0
var accel = 0.5
var maxspeed = 2
var defaultaccel = 0.2
var defaultmaxspeed = 2
var sprintaccel = 1
var sprintmaxspeed = 4
var friction = 0.05
var onground = false
var jumpheight = 5
var timeconst = 100
var colly = null
onready var networknode = get_tree().root.get_node("NetworkSetup")

func _ready():
	if name == str(get_tree().get_network_unique_id()):
		$Camera2D.current = true

func _process(delta):
	if name == str(get_tree().get_network_unique_id()):
		inputx = Input.get_action_strength("right") - Input.get_action_strength("left")
	
		if inputx != 0:
			velx += accel * inputx * delta * timeconst
			if abs(velx) > maxspeed:
				velx *= maxspeed / abs(velx)
		elif onground:
			velx -= velx * friction * delta * timeconst
		
		vely += gravity * delta * timeconst
		if vely > 0 && colly:
			if colly.collider.get_class() == "KinematicBody2D" || colly.collider.name == "Floor":
				onground = true
				vely = 0
			
		else:
			onground = false
		
		if Input.is_action_pressed("up") && onground == true:
			jump()
		
		if Input.is_action_pressed("sprint"):
			accel = sprintaccel
			maxspeed = sprintmaxspeed
		else:
			accel = defaultaccel
			maxspeed = defaultmaxspeed
		
		if get_tree().is_network_server():
			networknode.entities["1"]["position"] = global_position
			networknode.entities["1"]["velx"] = velx
			networknode.entities["1"]["vely"] = vely
		else:
			networknode.rpc_unreliable_id(1,"playertoserver",{
				"position": global_position,
				"velx": velx,
				"vely": vely,
			})
		
		if global_position.y > 10000:
			global_position = Vector2.ZERO
	
	move_and_slide(Vector2(velx * timeconst,0))
	colly = move_and_collide(Vector2(0,vely * delta * timeconst))

func jump():
	vely = -jumpheight
	velx *= 1.2
