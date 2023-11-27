extends Node2D

@export var horizontal_sway: Curve
@export var vertical_sway: Curve

@onready var initial_position := position


func calc_with_curves(time: float) -> Vector2:
    var t := time - int(time)
    return Vector2(horizontal_sway.sample(t), vertical_sway.sample(t))


func calc_with_trig(time: float) -> Vector2:
    var f := time * 2.0 * PI
    return Vector2(sin(f), 1.0 - absf(cos(f)))


func _process(_delta: float) -> void:
    var time := Time.get_unix_time_from_system()

    var offset := calc_with_curves(time)
    # var offset := calc_with_trig(time)

    position = initial_position + offset * Vector2(50, -50)
