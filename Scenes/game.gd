extends Control

var profit = 0

#Wheat variables
var wheat_amount = 1

#Carrot variables
var carrot_button_cost = 25
var carrot_amount = 5

signal profit_changed

#Wheat
	
func _on_wheat_button_button_down() -> void:
	profit += wheat_amount
	emit_signal("profit_changed", profit)
	
#Carot
func _on_carrot_button_button_down() -> void:
	profit += carrot_amount
	emit_signal("profit_changed", profit)
