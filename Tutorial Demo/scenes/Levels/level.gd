extends Node2D

var bullet_scene: PackedScene = preload("res://scenes/Projectiles/bullet.tscn")
var grenade_scene: PackedScene = preload("res://scenes/Projectiles/grenade.tscn")

@export var speed = 100
@export var throw_speed = 1000



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	camera_movement()

func camera_movement():
	var cam_dist_from_plyr = $Player.position.distance_to(get_global_mouse_position())
	var cam_speed = 0.5
#	print(cam_dist_from_plyr, ", ", cam_speed)
	
	var cam_new_pos
	if(cam_dist_from_plyr > 1000):
#		print($Player.position.direction_to(get_global_mouse_position()) * 1000)
		cam_new_pos = ($Player.position.direction_to(get_global_mouse_position()) * 1000) * Vector2(cam_speed, cam_speed)
	else:
		cam_new_pos = (get_global_mouse_position() - $Player.position) * Vector2(cam_speed, cam_speed)
	$Player/Camera2D.offset = lerp($Player/Camera2D.offset, cam_new_pos, 0.05)


func _on_player_firing(pos, dir):
	var bullet = bullet_scene.instantiate() as Area2D
	bullet.position = pos
	var spread = randf_range(-0.05, 0.05)
	bullet.rotation = $Player.rotation + 1.57 + spread
	bullet.direction = dir + Vector2(spread, spread)
	$Projectiles.add_child(bullet)
	
	#camera shake
	$Player/Camera2D.offset += Vector2(randf_range(-15, 15), randf_range(-15, 15))


func _on_player_throw_grenade(pos, dir):
	var thrown_grenade = grenade_scene.instantiate() as RigidBody2D
	thrown_grenade.position = pos
	thrown_grenade.linear_velocity = dir * throw_speed
	$Projectiles.add_child(thrown_grenade)
