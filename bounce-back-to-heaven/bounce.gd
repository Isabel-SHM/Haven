extends Area2D

const bounce = -600

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.velocity.y = bounce
