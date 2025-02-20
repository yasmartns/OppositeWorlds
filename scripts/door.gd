extends Area2D

var isOverDoor := false
var isLocked := true
@export var hud: NodePath
var hud_node: CanvasLayer

func _ready() -> void:
	hud_node = get_node(hud) as CanvasLayer

func _on_Door_body_entered(body: Node2D) -> void:
	isOverDoor = true
	
func _on_Door_body_exited(body: Node2D) -> void:
	isOverDoor = false
	

func _on_NearDoor_body_entered(body: Node2D) -> void:
	if hud_node.hasKey:
		$AnimatedSprite2D.play("closed")
		isLocked = false
