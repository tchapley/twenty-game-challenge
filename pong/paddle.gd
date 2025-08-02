extends CharacterBody2D

const SPEED = 100

func _process(_delta: float) -> void:
	var direction: float = Input.get_axis("ui_up", "ui_down")
	velocity = Vector2(0.0, direction * SPEED)
	move_and_slide()
