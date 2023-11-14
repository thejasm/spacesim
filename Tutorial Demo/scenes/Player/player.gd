extends CharacterBody2D

@export var speed = 400
@export var firerate = 0.1
@export var secondaryTimer = 2

var can_primary = true
var can_secondary = true

signal firing(pos, dir)
signal throw_grenade(pos, dir)


# Called when the node enters the scene tree for the first time.
func _ready():
	$PrimaryFirerate.wait_time = firerate
	$SecondaryTimer.wait_time = secondaryTimer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	# Input Movement
	var direction = Input.get_vector("PlayerMoveLeft", "PlayerMoveRight", "PlayerMoveUp", "PlayerMoveDown")
	velocity = direction * speed
	move_and_slide()
	
	# Rotation look at mouse
	look_at(get_global_mouse_position())
	
	# Primary and Secondary Action
	var dir = (get_global_mouse_position() - position).normalized()
	
	if(can_primary == true && Input.is_action_pressed("PrimaryAction")):
		firing.emit($barrel.global_position, dir)
		can_primary = false
		$PrimaryFirerate.start()
		
	if(can_secondary == true && Input.is_action_pressed("Secondary Action")):
		throw_grenade.emit(global_position, dir)
		can_secondary = false
		$SecondaryTimer.start()


func _on_primary_firerate_timeout():
	can_primary = true
func _on_secondary_timer_timeout():
	can_secondary = true
