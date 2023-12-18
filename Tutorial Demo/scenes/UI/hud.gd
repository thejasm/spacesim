extends CanvasLayer

@onready var ammo_label = $AmmoGrenadeCounterContainer/AmmoCounterContainer/AmmoCount
@onready var grenade_label = $AmmoGrenadeCounterContainer/GrenadeCounterContainer/GrenadeCount

var red: Color = Color(0.9, 0, 0, 1)
var green: Color = Color("6bbfa3")

func _ready():
	ammo_count_update()
	grenade_count_update()
	
func ammo_count_update():
	var ammo_icon = $AmmoGrenadeCounterContainer/AmmoCounterContainer/AmmoIcon
	var clip_size = Globals.clip_size
	
	ammo_label.text = str(clip_size)
	
	if(clip_size == 0): 
		ammo_icon.modulate = red
		ammo_label.modulate = red
	else: 
		ammo_icon.modulate = green
		ammo_label.modulate = green
	
func grenade_count_update():
	var grenade_icon = $AmmoGrenadeCounterContainer/GrenadeCounterContainer/GrenadeIcon
	var grenade_count = Globals.grenade_count
	
	grenade_label.text = str(grenade_count)
	
	if(grenade_count == 0): 
		grenade_icon.modulate = red
		grenade_label.modulate = red
	else: 
		grenade_icon.modulate = green
		grenade_label.modulate = green
	
