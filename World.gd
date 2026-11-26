extends Node2D

signal leveled_up


onready var enemy_in_world = get_node("classes_enemy_test")

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
	$score_label.modulate = coo
	$timer_label.modulate = coo

var health = 100 setget set_health, get_health
func set_health(new_value):
	health = clamp(new_value, 0, 100)
func get_health():
	return health


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Hello World!")
	print("10/19/2026, 13:09")
	$score_label.modulate = Color.white
	$timer_label.modulate = Color.white
	
	players["Rebekah"] = 4
	
	for n in players.keys(): 
		print(str(players[n]))
	
	self.connect("leveled_up", self, "_levelup")
	
	$button.rect_position = Vector2(474, 230)
	
	randomize()
	
	
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
	if event.is_action_pressed("my_action"):
		
		var damage = randi() % 701 + 100
		enemy_in_world._take_damage(damage)
	

var bnumber = 0

func _on_Button_pressed():
	#print("pressed " + str(bnumber))
	bnumber += 1
	$score_label.text = "Score: " + str(bnumber)
	var rand_x = randi() % 900 + 58
	var rand_y = randi() % 480 + 55
	$button.rect_position = Vector2(rand_x, rand_y)

var xp = int(0)

func _on_test_timer_timeout():
	xp += 5
	#print(xp)
	if xp >= 20:
		xp = 0
		emit_signal("leveled_up")
		
func _levelup():
	#print("yay!")
	return

func _on_timer_timeout():
	if (bnumber == 0):
		$timer_label.text = "Time's up! Why didn't you click the button T-T"
	elif (bnumber <= 10):
		$timer_label.text = "Time's up! That's a really low score..."
	elif (bnumber <= 15):
		$timer_label.text = "Time's up! Uh... Nice job!"
	elif (bnumber <= 20):
		$timer_label.text = "Time's up! That's pretty good!"
	elif (bnumber <= 30):
		$timer_label.text = "Time's up! Nice score!"
	elif (bnumber > 30):
		$timer_label.text = "Time's up! :0"
	$button.disconnect("pressed", self, "_on_Button_pressed")
	$timer.disconnect("timeout", self, "_on_timer_timeout")
	
func _process(delta):
	if ($timer.time_left != 0):
		$timer_label.text = "Timer: " + str(stepify($timer.time_left, 0.1))
