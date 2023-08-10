extends Node2D

var charSpeed = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		var target = get_node("PlayerController").global_position
		position = position.move_toward(target, charSpeed * delta)
	
