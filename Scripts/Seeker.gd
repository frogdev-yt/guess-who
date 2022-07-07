extends Node2D

var timeconst = 100
var velocity = Vector2.ZERO
var accel = 0.5
var maxspeed = 8
var friction = 0.05
var inputx = 0
var inputy = 0
var inputnorm = 0
var inputvec = Vector2.ZERO
var seeker = true
onready var networknode = get_tree().root.get_node("NetworkSetup")

# not used
var velx = 0
var vely = 0

func _ready():
	if name == str(get_tree().get_network_unique_id()):
		$Camera2D.current = true

func _process(delta):
	if name == str(get_tree().get_network_unique_id()):
		inputx = Input.get_action_strength("right") - Input.get_action_strength("left")
		inputy = Input.get_action_strength("down") - Input.get_action_strength("up")
		
		if inputx != 0 || inputy != 0:
			inputnorm = sqrt(pow(inputx,2) + pow(inputy,2))
			inputvec = Vector2(inputx/inputnorm,inputy/inputnorm)
			velocity += inputvec * accel * delta * timeconst
		else:
			inputvec = Vector2.ZERO
			velocity -= velocity * friction * delta * timeconst
		
		if velocity.length() > maxspeed:
			velocity *= maxspeed / velocity.length()
		
		position += velocity * delta * timeconst
		
		if Input.is_action_just_pressed("target"):
			if get_tree().is_network_server():
				networknode.makeguess(get_global_mouse_position())
			else:
				networknode.rpc_id(1,"makeguess",get_global_mouse_position())
