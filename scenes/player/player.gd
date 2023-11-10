extends CharacterBody2D

@export var charSpeed = 300
@export var Bullet: PackedScene
@onready var Camera = $CharacterCam
@export var fireRate = 0.1
var fireTimer = 0
var sniper = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	fireTimer += delta
	
	var directionX = Input.get_axis("PlayerMoveLeft", "PlayerMoveRight")
	var directionY = Input.get_axis("PlayerMoveUp","PlayerMoveDown")
	velocity.x = 0
	velocity.y = 0
	if directionX:
		velocity.x = directionX * charSpeed
	if directionY:
		velocity.y = directionY * charSpeed
	move_and_slide()
	
	self.look_at(get_global_mouse_position())
	
	if(Input.get_action_raw_strength("PlayerShoot")) && fireTimer >= fireRate:
		self.look_at(Vector2(randf_range(get_global_mouse_position().x - 40, get_global_mouse_position().x + 40), randf_range(get_global_mouse_position().y - 40, get_global_mouse_position().y + 40)))
		var bulletSpawn = Bullet.instantiate()
		fireTimer = 0
		
		add_sibling(bulletSpawn)
		
		bulletSpawn.global_position = $Gun/BulletSpawner.get("global_position")
		bulletSpawn.global_rotation = global_rotation
		if(sniper):
			bulletSpawn.speed *= 5
		bulletSpawn.speed *= clamp((randf()+0.5), 0.8, 1.2)
		
		bulletSpawn.set("area_direction", (Vector2(randf_range(get_global_mouse_position().x - 40, get_global_mouse_position().x + 40), randf_range(get_global_mouse_position().y - 40, get_global_mouse_position().y + 40)) - self.global_position).normalized())
		Camera.set("offset", Vector2(randf_range(-4, 4), randf_range(-4, 4)))
		
	if(Input.is_action_just_released("weapon select 1")):
		fireRate = 0.1
		sniper = 0
	elif(Input.is_action_just_released("weapon select 2")):
		fireRate = 0.01
		sniper = 0
	elif(Input.is_action_just_released("weapon select 3")):
		fireRate = 0.5
		sniper = 1
	
