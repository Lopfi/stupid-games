extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_drop_bullet(sender, velocity: Variant) -> void:
	print("DROP")
	var bullet = load("res://scenes/bullet.tscn")
	var bullet_instance = bullet.instantiate()
	var collision_shape = bullet_instance.get_node("CollisionShape2D")
	collision_shape.disabled = true  # Temporarily disable collisions
	bullet_instance.name = sender.get_name() + "_Bullet_" + str(Time.get_ticks_msec())
	bullet_instance.position = sender.position
	bullet_instance.linear_velocity = velocity
	$BulletContainer.add_child(bullet_instance)
	bullet_instance.call_deferred("initialize")
