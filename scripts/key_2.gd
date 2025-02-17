extends Area2D

func _on_Key2_body_entered(body: Node2D) -> void:
	visible = false
	set_collision_mask_value(0, false)
	$SoundKey2.play()


func _on_sound_key_2_finished() -> void:
	queue_free()
