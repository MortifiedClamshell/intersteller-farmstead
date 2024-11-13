extends Control

var wheat = 0
var click_amount = 1

signal wheat_changed

func _on_texture_button_button_down() -> void:
	wheat += click_amount
	emit_signal("wheat_changed", wheat)
