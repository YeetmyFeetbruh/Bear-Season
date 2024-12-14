extends Node3D

@onready var player = $Player
@onready var sun = $DirectionalLight3D
@onready var animation = $WorldAnimation
const BEAR = preload("res://scenes/bear.tscn")

@export var Time20x: bool
@export var DayStart: bool

func _ready():
	animation.play("sky")
	if Time20x == true:
		animation.speed_scale = 20
		$Timers/WorldClock.wait_time = 0.05
	if DayStart == true:
		animation.seek(620.0)
		am = true

func _on_bear_spawner_timeout():
	var new_bear = BEAR.instantiate()
	while new_bear.position.distance_to(Vector3(0, 10, 0)) < 40 && new_bear.position.distance_to(player.position) < 20:
		new_bear.position = Vector3(randf_range(0, 165), 15, randf_range(0, 165))
	add_child(new_bear)

func _process(delta):
	$UI/FPS.text = str(Engine.get_frames_per_second())


var hour = 12
var minute = 0
var am = false
func _on_world_clock_timeout():
	minute += 1
	if minute > 59:
		minute = 0
		hour += 1
	if hour > 12:
		hour = 1
		am = not am
	if minute < 10:
		if am == true:
			$UI/GlobalTime.text = str(hour)+":0"+str(minute)+"am"
		else:
			$UI/GlobalTime.text = str(hour)+":0"+str(minute)+"pm"
	else:
		if am == true:
			$UI/GlobalTime.text = str(hour)+":"+str(minute)+"am"
		else:
			$UI/GlobalTime.text = str(hour)+":"+str(minute)+"pm"
