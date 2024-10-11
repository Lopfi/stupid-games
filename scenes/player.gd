extends Node2D

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
@onready var drop_timer = $DropTimer
var bullet = preload("res://scenes/bullet.tscn")
var can_drop : bool = true

signal drop_bullet(velocity)

func _on_drop_timer_timeout() -> void:
	can_drop = true

func _spawn_bullet() -> void:
	print("Drop")

func _ready() -> void:
	screen_size = get_viewport_rect().size
	drop_timer.start()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = 0 # The player's movement
	if Input.is_action_pressed("move_right"):
		velocity += 1
	if Input.is_action_pressed("move_left"):
		velocity -= 1

	velocity = velocity * speed
	
	position.x += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity < 0:
		$Sprite2D.flip_v = false
	elif velocity > 0:
		$Sprite2D.flip_v = true
	
	if Input.is_action_pressed("drop") && can_drop:
		can_drop = false
		drop_bullet.emit(self, Vector2(0, 0))
		drop_timer.start()
	pass
