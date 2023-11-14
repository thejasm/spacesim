extends Node2D

var bullet_scene: PackedScene = preload("res://scenes/Projectiles/bullet.tscn")
var grenade_scene: PackedScene = preload("res://scenes/Projectiles/grenade.tscn")

@export var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Player/Camera2D.offset = (get_global_mouse_position() - $Player.position) * Vector2(0.5,0.5)


func _on_player_firing(pos, dir):
	var bullet = bullet_scene.instantiate() as Area2D
	bullet.position = pos
	var spread = randf_range(-0.1, 0)
	bullet.rotation = dir.angle() + 1.57 + spread
	bullet.direction = dir + Vector2(spread, spread)
	$Projectiles.add_child(bullet)


func _on_player_throw_grenade(pos, dir):
	var thrown_grenade = grenade_scene.instantiate() as RigidBody2D
	thrown_grenade.position = pos
	thrown_grenade.linear_velocity = dir * speed
	$Projectiles.add_child(thrown_grenade)
