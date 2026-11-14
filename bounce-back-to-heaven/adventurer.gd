extends CharacterBody2D

@onready var male = $male
@onready var female = $female

const SPEED = 120.0
const JUMP_VELOCITY = -250.0

func male_adventurer() -> void:
	male.visible = true
	female.visible = false
	
func female_adventurer() -> void:
	female.visible = true
	male.visible = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		female.play("jump")
		male.play("jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		female.flip_h = direction <0 
		male.flip_h = direction <0
		
		female.play("running")
		male.play("running")
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		female.stop()
		female.frame=3
		male.stop()
		male.frame=4

	move_and_slide()
