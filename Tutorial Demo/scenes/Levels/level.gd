extends Node2D

var bullet_scene: PackedScene = preload("res://scenes/Projectiles/bullet.tscn")
var grenade_scene: PackedScene = preload("res://scenes/Projectiles/grenade.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_firing(pos):
	var bullet = bullet_scene.instantiate()
	bullet.position = pos
	$Projectiles.add_child(bullet)


func _on_player_throw_grenade(pos):
	var thrown_grenade = grenade_scene.instantiate()
	thrown_grenade.position = pos
	$Projectiles.add_child(thrown_grenade)
