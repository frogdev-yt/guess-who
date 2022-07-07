extends Control


func _ready():
	$Panel/Button.connect("pressed",self,"_close_pressed")

func _close_pressed():
	hide()
