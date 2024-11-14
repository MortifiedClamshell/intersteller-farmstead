extends Control

var profit = 0
var wheat_amount = 1
var carrot_amount = 5

signal profit_changed

func _on_wheat_button_button_down() -> void:
	profit += wheat_amount
	emit_signal("profit_changed", profit)
	
func _on_carrot_button_button_down() -> void:
	profit += carrot_amount
	emit_signal("profit_changed", profit)
