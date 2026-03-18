extends Area2D

var speed = 500

func _physics_process(delta):
	position += -transform.y * speed * delta

func _on_body_entered(_body):
	queue_free()
