extends Node2D

var moveSpeed = 0.1
var stopSpeed = 0.5
var direction = Vector2(0,0)
var bounds = 100.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(
		!Input.is_action_pressed("PlayerMoveLeft") &&
		!Input.is_action_pressed("PlayerMoveRight")
	):
		direction.x = lerp(direction.x, 0.0, stopSpeed);
	if(
		!Input.is_action_pressed("PlayerMoveUp") &&
		!Input.is_action_pressed("PlayerMoveDown")
	):
		direction.y = lerp(direction.y, 0.0, stopSpeed);
		
		
	if(Input.is_action_pressed("PlayerMoveLeft")):
		direction.x = lerp(direction.x, 0 - bounds, moveSpeed);
	if(Input.is_action_pressed("PlayerMoveRight")):
		direction.x = lerp(direction.x, bounds, moveSpeed);
	if(Input.is_action_pressed("PlayerMoveUp")):
		direction.y = lerp(direction.y, 0 - bounds, moveSpeed);
	if(Input.is_action_pressed("PlayerMoveDown")):
		direction.y = lerp(direction.y, bounds, moveSpeed);
		
	position = direction
	

	
