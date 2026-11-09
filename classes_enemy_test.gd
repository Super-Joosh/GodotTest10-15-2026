extends Node2D
class_name Enemy


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
enum enemy_type_enum {ZOMBIE, SKELETON, SPIDER}
export(enemy_type_enum) var enemy_type = enemy_type_enum.ZOMBIE

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _take_damage(hit):
	print("Ow! [" + enemy_type + "-" + hit + " health]")
