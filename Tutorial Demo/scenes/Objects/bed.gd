extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$BigPillowSprite.rotation_degrees = randf_range(-5, 5)
	$SmallPillowSprite.rotation_degrees = randf_range(-5, 5)
