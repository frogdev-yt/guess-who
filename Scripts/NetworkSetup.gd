extends Control

onready var multiplayerconfigui = $MultiplayerConfig
onready var serveraddressbox = $MultiplayerConfig/ServerIpAddress
onready var lobbyui = $Lobby
onready var map = load("res://Scenes/Map1.tscn")
onready var npc = load("res://Entities/NPC.tscn")
onready var hider = load("res://Entities/Hider.tscn")
onready var seeker = load("res://Entities/Seeker.tscn")
onready var popsound = load("res://Audio/pop.ogg")
onready var buzzsound = load("res://Audio/wrongbuzz.ogg")

var npcamount = 100
var seekeramount = 1
var hidersamount = 0
var guessdelay = 5
var guessdist = 10
var connectedplayers = [1]

# each key is a player id or an npc name, and has another dictionary
# player id second dictionaries have type (which is hider or seeker), velocity and position
var entities = {}
var guessdelays = {}

var gamestarted = false

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().connect("network_peer_connected",self,"_player_connected")
	get_tree().connect("network_peer_disconnected",self,"_player_disconnected")
	get_tree().connect("connected_to_server",self,"_connected_to_server")
	get_tree().connect("connection_failed", self, "_connection_failed")
	get_tree().connect("server_disconnected", self, "_server_disconnected")
	$MultiplayerConfig/VBoxContainer/CreateServer.connect("pressed",self,"_on_createserver_pressed")
	$MultiplayerConfig/VBoxContainer/JoinServer.connect("pressed",self,"_on_joinserver_pressed")
	$Lobby/HostOptions/StartButton.connect("pressed",self,"_on_startgame_pressed")
	$Lobby/HostOptions/VBoxContainer/NPCAmount/TextEdit.connect("text_changed",self,"_on_npcamount_changed")
	$Lobby/HostOptions/VBoxContainer/TimeLimit/TextEdit.connect("text_changed",self,"_on_timelimit_changed")
	$Lobby/HostOptions/VBoxContainer/GuessDelay/TextEdit.connect("text_changed",self,"_on_guessdelay_changed")
	$Lobby/HostOptions/VBoxContainer/GuessDist/TextEdit.connect("text_changed",self,"_on_guessdist_changed")
	$Lobby/HostOptions/VBoxContainer/SeekerAmount/TextEdit.connect("text_changed",self,"_on_seekeramount_changed")
	$Timer.connect("timeout",self,"_timerout")

func _process(delta):
	updateentities()
	
	if get_tree().network_peer && get_tree().network_peer.get_connection_status() == get_tree().network_peer.CONNECTION_CONNECTED && get_tree().is_network_server():
		rpc_unreliable("servertoplayer",entities)
		
		var timestr1 = str(floor($Timer.time_left/60))
		if timestr1.length() < 2:
			timestr1 = "0" + timestr1
		
		var timestr2 = str(floor(fmod($Timer.time_left,60)))
		if timestr2.length() < 2:
			timestr2 = "0" + timestr2
		
		var timestr = timestr1 + ":" + timestr2
		$CanvasLayer/Label.text = timestr
		rpc("synctimer",timestr)
		
		for i in guessdelays.keys():
			if guessdelays[i] > 0:
				guessdelays[i] -= delta

func _player_connected(id):
	print("Player " + str(id) + " connected")
	printlog("Player " + str(id) + " connected")
	
	if !connectedplayers.has(id):
		connectedplayers.append(id)
		lobbyui.get_node("ItemList").add_item(str(id))
	
	# send player list and such to new player
	if get_tree().is_network_server():
		rpc_id(id,"newplayer",connectedplayers)
	
	# server sends message to connected player to load stuffs
	if gamestarted && get_tree().is_network_server():
		rpc_id(id,"startgame")
		entities[str(id)] = {
			"type": "seeker",
			"position": Vector2(0,0),
			"velx": 0,
			"vely": 0
		}

func _player_disconnected(id):
	print("Player " + str(id) + " disconnected")
	printlog("Player " + str(id) + " disconnected")
	connectedplayers.erase(id)
	lobbyui.get_node("ItemList").items.erase(id)
	
	# if player has been spawned
	if entities.has(id):
		if entities[str(id)].type == "hider":
			hidersamount -= 1
			if get_tree().is_network_server():
				checkforgameend()
		# remove playeur
		entities.erase(id)
		if get_tree().root.has_node("Map1/" + str(id)):
			get_tree().root.get_node("Map1").remove_child(get_tree().root.get_node("Map1").get_node("Map1/" + str(id)))

func _on_createserver_pressed():
	Network.create_server()
	multiplayerconfigui.hide()
	lobbyui.show()
	lobbyui.get_node("HostOptions").show()
	
	for i in connectedplayers:
		lobbyui.get_node("ItemList").add_item(str(i))

func _on_joinserver_pressed():
	if serveraddressbox.text != "":
		Network.join_server(serveraddressbox.text)

func _on_startgame_pressed():
	if connectedplayers.size() > seekeramount:
		serverstartgame()
	else:
		# serverstartgame() for debug purpose
		printlog("Not enough players to start match!")

func _on_npcamount_changed(text):
	npcamount = int(text)

func _on_timelimit_changed(text):
	$Timer.wait_time = float(text)

func _on_guessdelay_changed(text):
	guessdelay = float(text)

func _on_guessdist_changed(text):
	guessdist = float(text)

func _on_seekeramount_changed(text):
	seekeramount = int(text)

func printlog(text : String):
	$CanvasLayer/Log.text = text

func _connected_to_server():
	multiplayerconfigui.hide()
	lobbyui.show()
	
	print("connected to server!")
	printlog("Connected to server!")

func _connection_failed():
	print("connection failed :(")
	printlog("Connection failed :(")

func _server_disconnected():
	stopgame()
	lobbyui.hide()
	multiplayerconfigui.show()
	print("server disconnected")
	printlog("Server disconnected")

remote func playertoserver(playerprops):
	var key = str(get_tree().get_rpc_sender_id())
	if entities.has(key):
		entities[key]["position"] = playerprops["position"]
		entities[key]["velx"] = playerprops["velx"]
		entities[key]["vely"] = playerprops["vely"]

# call as unreliable
remote func servertoplayer(e):
	if !get_tree().is_network_server():
		entities = e
	else:
		print("servertoplayer executing on server lol")

remote func startgame():
	get_tree().root.add_child(map.instance())
	multiplayerconfigui.hide()
	lobbyui.hide()
	$CanvasLayer/Label.show()
	gamestarted = true

func updateentities():
	if gamestarted:
		for i in entities.keys():
		
			# if entity node has been created
			if get_tree().root.get_node("Map1").has_node(i):
				# only change things not in control of, aka:
				# only change npcs if not server, and only change other players not this player
				if str(i).find("NPC") != -1 && !get_tree().is_network_server():
					get_tree().root.get_node("Map1/" + i).global_position = entities[i].position
					get_tree().root.get_node("Map1/" + i).velx = entities[i].velx
					get_tree().root.get_node("Map1/" + i).vely = entities[i].vely
				
				if i != str(get_tree().get_network_unique_id()) && str(i).find("NPC") == -1:
					get_tree().root.get_node("Map1/" + i).global_position = entities[i].position
					get_tree().root.get_node("Map1/" + i).velx = entities[i].velx
					get_tree().root.get_node("Map1/" + i).vely = entities[i].vely
			
			# if entity node has not been created
			else:
				# if i is an npc
				if str(i).find("NPC") != -1:
					var inst = npc.instance()
					inst.name = i
					randomize()
					var randx = rand_range(-500,500)
					randomize()
					var randy = rand_range(-500,750)
					inst.global_position = Vector2(randx,randy)
					get_tree().root.get_node("Map1").add_child(inst)
					print("creating npc " + i)
				
				# if i is a hider
				elif entities[i].type == "hider":
					var inst = hider.instance()
					inst.name = i
					get_tree().root.get_node("Map1").add_child(inst)
					print("creating hider " + str(i))
				
				# if i is a seeker
				elif entities[i].type == "seeker":
					var inst = seeker.instance()
					inst.name = i
					get_tree().root.get_node("Map1").add_child(inst)
					print("creating seeker " + str(i))

func serverstartgame():
	# load map
	get_tree().root.add_child(map.instance())
	
	# hide lobby ui
	lobbyui.hide()
	$CanvasLayer/Label.show()
	
	# pick random seekers
	var seekerpicks = []
	var notpicked = connectedplayers
	
	for i in seekeramount:
		randomize()
		var rannum = round(rand_range(0,notpicked.size() - 1))
		seekerpicks.append(str(connectedplayers[rannum]))
		notpicked.erase(str(connectedplayers[rannum]))
	
	print(seekerpicks)
	hidersamount = connectedplayers.size() - seekeramount
	print("hidersamount is " + str(hidersamount))
	
	# add players into entities as hiders
	for i in connectedplayers:
		var key = str(i)
		entities[key] = {}
		entities[key]["position"] = Vector2(0,0)
		entities[key]["velx"] = 0
		entities[key]["vely"] = 0
		if seekerpicks.has(key):
			entities[key].type = "seeker"
		else:
			entities[key].type = "hider"
	
	# add npcs into entities
	for i in npcamount:
		var key = "NPC" + str(i)
		entities[key] = {}
		entities[key]["position"] = Vector2(0,0)
		entities[key]["velx"] = 0
		entities[key]["vely"] = 0
	
	gamestarted = true
	rpc("startgame")
	$Timer.start()

remote func stopgame():
	entities = {}
	lobbyui.show()
	$Timer.stop()
	$CanvasLayer/Label.hide()
	gamestarted = false
	get_tree().root.get_node("Map1").queue_free()

remote func newplayer(connected):
	connectedplayers = connected
	for i in connectedplayers:
		if !lobbyui.get_node("ItemList").items.has(str(i)):
			lobbyui.get_node("ItemList").add_item(str(i))

remote func makeguess(pos):
	
	var id
	print(get_tree().get_rpc_sender_id())
	if get_tree().get_rpc_sender_id() != 0:
		id = get_tree().get_rpc_sender_id()
	else:
		id = 1
	
	if guessdelays.has(str(id)) && guessdelays[str(id)] > 0:
		# do not guess, delayed
		print("Cannot guess right now, delayed!")
		printlog("Cannot guess right now, delayed!")
	else:
		# guess
		for i in get_tree().root.get_node("Map1").get_children():
			if pos.distance_to(i.global_position) < guessdist:
				# if clicked on hider:
				if str(i.name).find("NPC") == -1 && i.get("seeker") == null:
					if id == 1:
						correctguess()
					else:
						rpc_id(id,"correctguess")
					
					entities[i.name].type = "seeker"
					rpc("servertoplayer",entities)
					rpc("hidertoseeker",i.name)
					hidersamount -= 1
					get_tree().root.get_node("Map1").remove_child(get_tree().root.get_node("Map1/" + i.name))
					checkforgameend()
					return
		
		if id == 1:
			wrongguess()
		else:
			rpc_id(id,"wrongguess")
		
		guessdelays[str(id)] = guessdelay

remote func taunt(pos):
	$TauntPlayer.position = pos
	$TauntPlayer.play()

remote func wrongguess():
	$Player.stream = buzzsound
	$Player.play()
	printlog("Guess missed!")

remote func correctguess():
	$Player.stream = popsound
	$Player.play()
	printlog("Guess was correct!")

remote func hidertoseeker(id):
	# delete hider node, update function will instance new one of correct type automatically ( i Think)
	get_tree().root.get_node("Map1").remove_child(get_tree().root.get_node("Map1/" + id))

remote func synctimer(timestr):
	$CanvasLayer/Label.text = timestr

func checkforgameend():
	if hidersamount < 1:
		seekerswin()
		rpc("seekerswin")

func _timerout():
	if get_tree().is_network_server():
		hiderswin()
		rpc("hiderswin")

remote func hiderswin():
	stopgame()
	$WinScreen/Panel/Label.text = "HIDERS WIN"
	$WinScreen.show()

remote func seekerswin():
	stopgame()
	$WinScreen/Panel/Label.text = "SEEKERS WIN"
	$WinScreen.show()
