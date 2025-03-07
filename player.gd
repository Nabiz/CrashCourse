extends CharacterBody2D
class_name Player

@export var SPEED = 300.0
@export var JUMP_VELOCITY = -600.0

var face_direction: int
@onready var sprite = $Sprite2D


func _ready() -> void:
	face_direction = 1
	sprite.flip_h = false
	

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_select"):
		attack()


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if abs(direction) > 0.01:
		change_direction(direction)
	
	move_and_slide()


func change_direction(direction: float):
	if direction > 0:
		face_direction = 1
		sprite.flip_h = false
	else:
		face_direction = -1
		sprite.flip_h = true
	


func attack():
	print("I cannot fight!")
