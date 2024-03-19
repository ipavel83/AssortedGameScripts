extends Camera3D

# @export var ball_scene: PackedScene = preload("res://ball.tscn")

@export var camera : Node3D
@export var target : Node3D

var _cam_rotation_x := 0.0
var _cam_rotation_y := 0.0

var _deltaTime :=0.0

var eventt

func _process(delta: float) -> void:
	_deltaTime = delta
	if eventt is InputEventMouseMotion:
		if not eventt.button_mask and (MOUSE_BUTTON_MASK_LEFT or MOUSE_BUTTON_MASK_RIGHT ):
			_cam_rotation_x += eventt.relative.x * 0.3 * _deltaTime
			_cam_rotation_y += eventt.relative.y * 0.2 * _deltaTime
			target.set_rotation(Vector3.UP * _cam_rotation_x + Vector3.RIGHT * _cam_rotation_y)

func _unhandled_input(event: InputEvent):
	eventt = event


