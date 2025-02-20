extends Area2D

@export var hud: NodePath
var hud_node: CanvasLayer

func _ready() -> void:
	hud_node = get_node(hud) as CanvasLayer

func _on_Key2_body_entered(body: Node2D) -> void:
	visible = false
	set_collision_mask_value(1, false)
	$SoundKey2.play()
	
	var key2_node = hud_node.get_node_or_null("Key2")
	if key2_node and key2_node is TextureRect:
		key2_node.texture = load("res://assets/items/key NW-sprite.png")
		
		if hud_node.has_method("set_has_key"):
			hud_node.set_has_key(true)

func _on_sound_key_2_finished() -> void:
	queue_free()
