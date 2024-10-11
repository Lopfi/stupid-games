extends Area2D

@export var multiplier = 5

signal drop_bullet(velocity)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$RichTextLabel.text = "[center]%sX[/center]" % multiplier
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	print(body.name)
	
	if body.name.begins_with(name):
		return
	
	var velocity = body.linear_velocity
	
	for n in range(multiplier):
		drop_bullet.emit(self, velocity)
