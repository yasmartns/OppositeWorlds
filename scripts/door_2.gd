extends Area2D

var isOverDoor2 := false
var isLocked2 := true
@export var hud: NodePath
var hud_node: CanvasLayer

func _ready() -> void:
	hud_node = get_node(hud) as CanvasLayer

func _on_Door2_body_entered(body: Node2D) -> void:
	isOverDoor2 = true
	
func _on_Door2_body_exited(body: Node2D) -> void:
	isOverDoor2 = false
	
func _on_NearDoor2_body_entered(body: Node2D) -> void:
	if hud_node.hasKey:
		$AnimatedSprite2D.play("closed")
		isLocked2 = false
		$SoundUnlock2.play()
		
func _physics_process(delta: float) -> void:
	if isOverDoor2 and hud_node.hasKey and Input.is_action_just_pressed("ui_up"):
		$AnimatedSprite2D.play("open")
	elif isOverDoor2 and Input.is_action_just_pressed("ui_up"):
		$SoundLocked2.play()
