extends RigidBody2D


func initialize() -> void:
	var collision_shape = $CollisionShape2D
	collision_shape.disabled = false  # Enable collisions again


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
