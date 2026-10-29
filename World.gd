extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var players = {
	"Joshua": 1, 
	"Javia": 2, 
	"Rohit": 3,
}

enum LABELCOLOR {RED, BLUE, GREEN}

export(LABELCOLOR) var labelcolor = LABELCOLOR.RED

func color_label(coo):
	$Score.modulate = coo
	$Timer.modulate = coo

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Hello World!")
	print("10/19/2026, 13:09")
	$Score.modulate = Color.white
	$Timer.modulate = Color.white
	
	players["Rebekah"] = 4
	
	for n in players.keys(): 
		print(str(players[n]))
	
func _input(event):
	if event.is_action_pressed("my_action"):
		if labelcolor == LABELCOLOR.RED:
			color_label(Color.red)
		elif labelcolor == LABELCOLOR.BLUE:
			color_label(Color.blue)
		elif labelcolor == LABELCOLOR.GREEN:
			color_label(Color.green)
	if event.is_action_released("my_action"):
		color_label(Color.white);
	#if event.is_action_pressed("my_action"):
	#	$Score.modulate = Color.blue
	#if event.is_action_released("my_action"):
	#	$Score.modulate = Color.white
	#if event.is_action_pressed("my_action"):
	#	$Timer.modulate = Color.red
	#if event.is_action_released("my_action"):
	#	$Timer.modulate = Color.white
	

