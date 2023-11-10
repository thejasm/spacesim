extends Area2D

@export var speed = 3000.0
var area_direction = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.translate(area_direction * speed * delta)
	
