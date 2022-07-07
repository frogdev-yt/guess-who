extends Node2D

var peer = NetworkedMultiplayerENet.new()
var type = "seeker"
var players = []
var port = 7224
var maxplayers = 16

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().connect("connected_to_server", self, "server_connected")
	get_tree().connect("server_disconnected", self, "server_disconnected")

func create_server():
	peer.create_server(port, maxplayers)
	get_tree().network_peer = peer
	

func join_server(ip):
	peer.create_client(ip, port)
	get_tree().network_peer = peer

func server_connected():
	print("server connected")

func server_disconnected():
	print("server disconnected")
