extends CharacterBody2D

@onready var x_array: Array[float] = [0, 320]
@onready var y_array: Array[float] = [24, 168]

var initial_distance: Vector2
var running_time: float = 0

func _ready() -> void:
	var initial_direction: Vector2 = Vector2(x_array.pick_random(), randf_range(y_array[0], y_array[1]))
	initial_distance = initial_direction - global_position
	velocity = initial_distance.normalized() * 100

func _physics_process(delta: float) -> void:
	running_time += delta
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal()).normalized() * 100 * (1 + clampf(running_time / 60, 0.0, 1.0))
