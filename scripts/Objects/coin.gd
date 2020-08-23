extends Area2D
signal coin_collected


func _on_coin_body_entered(body: Node) -> void:
	$coin_animation.play("bounce")
	$soundCoin.play()
	body.add_coin()
	emit_signal("coin_collected")
	set_collision_mask_bit(0,false)
func _on_coin_animation_finished(anim_name: String) -> void:
	queue_free()
