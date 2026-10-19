extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Hello World!")
	
func _input(event):
	if event.is_action_pressed("my_action"):
		$Score.modulate = Color.blue
	if event.is_action_released("my_action"):
		$Score.modulate = Color.white
