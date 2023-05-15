extends CharacterBody2D

@export var speed: int = 100
@onready var animations = $AnimationPlayer

func handleInput():
	var moveDirection = Input.get_vector("ui_left","ui_right", "ui_up", "ui_down") 
	velocity = moveDirection*speed
	
func updateAnimation():
	if velocity.length() == 0:
		if animations.is_playing():
			animations.stop()
	else:
		var moveDirection = "Down"
		if velocity.x < 0: moveDirection = "Left"
		elif velocity.x > 0: moveDirection = "Right"
		elif velocity.y < 0: moveDirection = "Up"
	
		animations.play("walk" + moveDirection)
		
func _physics_process(_delta):
	handleInput()
	move_and_slide()
	updateAnimation()
