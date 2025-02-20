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
		$SoundUnlock.play()
		
func _physics_process(delta: float) -> void:
	if isOverDoor and hud_node.hasKey and Input.is_action_just_pressed("ui_up"):
		$AnimatedSprite2D.play("open")
	elif isOverDoor and Input.is_action_just_pressed("ui_up"):
		$SoundLocked.play()
