extends Area2D

var isOverDoor := false


func _on_Door_body_entered(body: Node2D) -> void:
	isOverDoor = true
func _on_Door_body_exited(body: Node2D) -> void:
	isOverDoor = false
