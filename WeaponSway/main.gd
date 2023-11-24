extends Node2D


func _ready() -> void:
    var tween := create_tween()
    tween.tween_property($Background/Tiles, "position", Vector2(0, 800), 5)
    tween.set_loops()
