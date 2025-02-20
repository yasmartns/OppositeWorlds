extends Area2D

@export var hud: NodePath
var hud_node: CanvasLayer
var isOverDoor := false

func _ready() -> void:
	hud_node = get_node(hud) as CanvasLayer
	
func _on_Door_body_entered(body: Node2D) -> void:
	isOverDoor = true

func _on_Door_body_exited(body: Node2D) -> void:
	isOverDoor = false


func _on_near_door_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
