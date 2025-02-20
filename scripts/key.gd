extends Area2D

@export var hud: NodePath
var hud_node: CanvasLayer

func _ready() -> void:
	hud_node = get_node(hud) as CanvasLayer

func _on_key_body_entered(body: Node2D) -> void:
	visible = false
	set_collision_mask_value(1, false)
	$SoundKey.play()
	
	var key_node = hud_node.get_node_or_null("Key")
	if key_node and key_node is TextureRect:
		key_node.texture = load("res://assets/items/key LW-sprite.png")
		
		if hud_node.has_method("set_has_key"):
			hud_node.set_has_key(true)

func _on_sound_key_finished() -> void:
	queue_free()
